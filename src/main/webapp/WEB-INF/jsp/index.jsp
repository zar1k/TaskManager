<%--
  author A.Zarazka
  version 1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Task Manager for Spring Boot</title>

    <!-- Bootstrap -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- My style.css -->
    <link href="/static/css/style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<%-- Navigation --%>
<div role="navigation">
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="/" class="list-inline navbar-nav logo-home" title="Task Manager">
                    <img id="logo-home-img" src="/static/img/logo-task-clipart-task.svg">Task Manager
                </a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="new-task">New Task</a></li>
                    <li><a href="all-tasks">All Tasks</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<%-- /Navigation --%>

<c:choose>
    <%-- Home --%>
    <c:when test="${mode == 'MODE_HOME'}">
        <div class="container" id="homeDiv">
            <div class="jumbotron text-center">
                <h1>Welcome to Tasks Manager</h1>
                <br>
                <img src="/static/img/task-management.jpg" class="img-responsive center-block">
            </div>
        </div>
    </c:when>
    <%-- /Home --%>

    <%-- All tasks --%>
    <c:when test="${mode == 'MODE_TASKS'}">
        <div class="container text-center" id="tasksDiv">
            <h3>My Tasks</h3>
            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-bordered text-left">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>DESCRIPTION</th>
                        <th>DATE CREATED</th>
                        <th>FINISHED</th>
                        <th class="text-center">ACTION</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="task" items="${tasks}">
                        <tr>
                            <td>${task.id}</td>
                            <td>${task.name}</td>
                            <td>${task.description}</td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${task.dateCreated}"/></td>
                            <td>${task.finished}</td>
                            <td class="text-center">
                                <a href="update-task?id=${task.id}"><span class="glyphicon glyphicon-pencil"></span></a>
                                |
                                <a href="delete-task?id=${task.id}"><span class="glyphicon glyphicon-trash"></span></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:when>
    <%-- /All tasks --%>

    <%-- New task and update task --%>
    <c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
        <div class="container text-center">
            <h3>Add a new task</h3>
            <hr>
            <form class="form-horizontal" method="post" action="save-task">
                <input type="hidden" name="id" value="${task.id}"/>
                <div class="form-group">
                    <label class="control-label col-md-3" for="taskName">Name</label>
                    <div class="col-md-6">
                        <input id="taskName" type="text" class="form-control" name="name" value="${task.name}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3" for="taskDesc">Description</label>
                    <div class="col-md-6">
                        <input type="text" id="taskDesc" class="form-control" name="description"
                               value="${task.description}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Finished</label>
                    <div class="col-md-1">
                        <label class="radio-inline" for="finishedTrue">
                            <input type="radio" id="finishedTrue" name="finished" value="true"/>Yes
                        </label>
                    </div>
                    <div class="col-md-1">
                        <label class="radio-inline" for="finishedFalse">
                            <input type="radio" id="finishedFalse" name="finished" value="false" checked/>No
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-5 col-md-7">
                        <input type="submit" class="btn btn-primary" value="Save"/>
                    </div>
                </div>
            </form>
        </div>
    </c:when>
    <%-- /New task and update task --%>
</c:choose>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/static/js/bootstrap.min.js"></script>
</body>
</html>