@extends('layouts.admin')

@section('content')
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        SMS
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="{{ route('home')}}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Exam Reports</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Exam Reports</h3>

          <div class="box-tools">
            <button type="button" class="btn btn-box-tool pull-right" data-widget="collapse" data-toggle="tooltip"
                    title="Collapse">
              <i class="fa fa-minus"></i></button>
          </div>
        </div>
        <div class="box-body">
            
            <div class="box box-default">
          <div class="box-header with-border">
            <h3 class="box-title"></h3>
            <button onClick="return printR()" class="btn btn-sm btn-info pull-right" ><i class="fa fa-printer"></i>Print</button>
          </div>
          <div class="box-body">
        <div id="myDiv" class="box-body table-responsive no-padding">
        <h3 class="box-title">General Exam Reports 2021</h3>
              <!--tbl -->
                <table  id="example" class="table table-bordered table-striped">
                <thead><tr>
                 <th>#.</th>
                 <th>RegNo.</th>
                 <th>Surname</th>
                 <th>Scores</th>
                 <th>Year</th>
                 <th></th>
                </tr></thead>
                <tbody>
                @php $passes = 0;@endphp
                @php $fails = 0;@endphp
                @php $na = 0;@endphp
                
                @foreach($results as $result)
                <tr>
                 <td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#report-{{ $result->id}}">{{ $result->id}}.</button></td>
                 <td>{{ $result->regNo}}</td>
                 <td>{{ $result->surName}}</td>
                 @php $tots=0;@endphp
                 <td>@if(count($result->studentExam) > 0)
                        @foreach($result->studentExam as $exam)
                        @if($exam->courseCode == $id)
                          @php $tots+=$exam->marks;@endphp
                          {{$exam->marks}}%
                        @endif
                        @endforeach
                     @endif
                    </td>
                  <td>2021</td>
                <td>
                  @if(count($result->studentExam) > 0)
                    @if($tots/count($result->studentExam) >= 40)
                    @php $passes += 1;@endphp
                    <span class="text-success">Pass</span>
                    @else
                    @php $fails += 1;@endphp
                    <span class="text-danger">Fail</span>
                    @endif
                  @else
                    @php $na += 1;@endphp
                    <span class="text-warning">N/A</span>
                  @endif
                </td>
                
                <!-- modal -->
                <div class="modal fade" id="report-{{ $result->id}}" aria-modal="true" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body"  id="{{$result->id}}">
                              <h4 class="modal-title">MKU - Thika</h4>
                              <h4 class="modal-title">Results for {{ $result->surName}} of {{ $result->regNo}}</h4>
                            @if(count($result->studentExam) > 0)
                            @php $total = 0;@endphp
                                @foreach($result->studentExam as $exam)
                                <ul>    
                                    <li>{{$exam->courseCode}} : {{$exam->courseTitle}} - {{$exam->marks}}%</li>
                                </ul>
                                @php 
                                  $total += $exam->marks;
                                  if($total > 40) {
                                    $grade = 'Pass';
                                  } else {
                                    $grade = 'Fail';
                                  }
                                @endphp
                                @endforeach
                                <p><b>Total: </b> {{ $total }} </p>
                                <p><b>Mean: </b> {{ $total/count($result->studentExam) }} - {{$grade}} </p>
                            @else
                              <p>No results for the year</p>
                            @endif
                            </div>
                            <div class="modal-footer justify-content-between">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> 
                                <button type="button" onClick="return printRes({{ $result->id}})"  class="btn btn-info" data-dismiss="modal">Print</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ./modal -->
                </tr></tbody>
                @endforeach
                <h4><b>Passes:</b> {{ $passes }}</h4>
                <h4><b>Fails:</b> {{ $fails }}</h4>
                <h4><b>N/A:</b> {{ $na }}</h4>
                <tfoot>
                    <tr>
                    <th>#.</th>
                    <th>RegNo.</th>
                    <th>Surname</th>
                    <th>Scores</th>
                    <th>Year</th>
                    </tr>
                </tfoot>
                </table>
                
               
              <!--/tbl-->
        </div>
        </div>
        <!-- /.box-body -->
        </div>
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
      
      </section>
    <!-- /.content -->
    
@endsection
<script>
    function printR() {
        var prtContent = document.getElementById("myDiv");
        var WinPrint = window.open();
        WinPrint.document.write(prtContent.innerHTML);
        WinPrint.document.write( "<link rel='stylesheet' href='style.css' type='text/css' media='print'/>" );
        WinPrint.document.close();
        WinPrint.focus();
        WinPrint.print();
        WinPrint.close();
    }
    function printRes(id) {
        var prtContent = document.getElementById(id);
        var WinPrint = window.open();
        WinPrint.document.write(prtContent.innerHTML);
        WinPrint.document.write( "<link rel='stylesheet' href='style.css' type='text/css' media='print'/>" );
        WinPrint.document.close();
        WinPrint.focus();
        WinPrint.print();
        WinPrint.close();
    }
</script>