<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\requests;
use App\parents;
use App\responses;

class smsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //fetch stud
        $requests = requests::latest()->paginate(5);
        return view('sms.index', compact('requests'))
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
        return view('sms.create');
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
            requests::create($request->all());
            return redirect()->route('sms.index')
        ->with("success","New requests Added Successfully!");
         
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
         $requests = requests::find($id);
        return view('sms.details', compact('requests'));
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
        $requests = requests::find($id);
        return view('sms.edit', compact('requests'));
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
            $requests = requests::find($id);
            $requests->regNo = $request->get('regNo');
            $requests->idNo = $request->get('idNo'); 
            $requests->phoneNo = $request->get('phoneNo');
            $requests->email= $request->get('email');
            $requests->surName = $request->get('surName');
            $requests->otherName = $request->get('otherName');
            $requests->parentPhone = $request->get('parentPhone');
            $requests->yos = $request->get('yos');
            $requests->save();
            return redirect()->route('sms.index')
        ->with("success","requests Updated Successfully!");

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
        $requests = requests::find($id);
         $requests->delete();
            return redirect()->route('sms.index')
        ->with("success","SMS Deleted Successfully!");
    }
}
