<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\student;
use App\parents;

class studentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //fetch stud
        $students = student::latest()->paginate(5);
        return view('student.index', compact('students'))
                ->with('i',(request()->input('page',1)-1)*5);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        
        $parents = parents::all();
        return view('student.create', compact('parents'));
        //return view('student.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $request->validate([
            'regNo' => 'required',
            'idNo' => 'required', 
            'phoneNo' => 'required',
            'email' => 'required',
            'surName' => 'required',
            'otherName' => 'required',
            'parentPhone' => 'required',
            'yos' => 'required'
        ]);
            student::create($request->all());
            return redirect()->route('student.index')
        ->with("success","New student Added Successfully!");
          //parent
         $request->validate([
            'surName1' => 'required',
            'idNo1' => 'required',
            'otherName1' => 'required',
            'phoneNo1' => 'required',
            'email1' => 'required'
        ]);
        $parents = new parents();
        $parents->surName = $request->get('surName1');
        $parents->idNo = $request->get('idNo1');
        $parents->otherName = $request->get('otherName1');
         $parents->phoneNo = $request->get('phoneNo1');
         $parents->email = $request->get('email1');
            $parents->save();
            return redirect()->route('student.create')
        ->with("success","Parent Added Successfully!");

       
    }
    public function addParent(Request $request)
    {
        //
        $request->validate([
            'surName' => 'required',
            'otherName' => 'required',
            'phoneNo' => 'required',
            'idNo' => 'required',
            'email' => 'required'
        ]);
            parents::create($request->all());
            return redirect()->route('student.create')
        ->with("success","parent Added Successfully!");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
         $student = student::find($id);
        return view('student.details', compact('student'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $student = student::find($id);
        return view('student.edit', compact('student'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $request->validate([
            'regNo' => 'required',
            'idNo' => 'required', 
            'phoneNo' => 'required',
            'email' => 'required',
            'surName' => 'required',
            'otherName' => 'required',
            'parentPhone' => 'required',
            'yos' => 'required'
        ]);
            $student = student::find($id);
            $student->regNo = $request->get('regNo');
            $student->idNo = $request->get('idNo'); 
            $student->phoneNo = $request->get('phoneNo');
            $student->email= $request->get('email');
            $student->surName = $request->get('surName');
            $student->otherName = $request->get('otherName');
            $student->parentPhone = $request->get('parentPhone');
            $student->yos = $request->get('yos');
            $student->save();
            return redirect()->route('student.index')
        ->with("success","Student Updated Successfully!");

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $student = student::find($id);
         $student->delete();
            return redirect()->route('student.index')
        ->with("success","Student Deleted Successfully!");
    }
}
