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
                </tr></thead>
                <tbody>
                @foreach($results as $result)
                <tr>
                 <td>{{ $result->id}}.</td>
                 <td>{{ $result->regNo}}</td>
                 <td>{{ $result->surName}}</td>
                 <td>@if(count($result->studentExam) > 0)
                        @foreach($result->studentExam as $exam)
                        <ul>    
                            <li>{{$exam->courseCode}}: {{$exam->marks}}%</li>
                        </ul>
                        @endforeach
                     @endif
                </td>
                <td>2021</td>
                </tr></tbody>
                @endforeach
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
</script>