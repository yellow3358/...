<%-- 
    Document   : registration-list-admin
    Created on : Feb 28, 2024, 10:09:24 PM
    Author     : nocol
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <title>List registrations</title>
    </head>
    <body>
        <div class="container">
            <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
                <a href="home" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                    <!--<svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>-->
                    <h1>License Registration System</h1>
                </a>
                <c:if test="${sessionScope.user eq null}">
                    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                        <!--<li><a href="" class="nav-link px-2 link-dark">Register</a></li>-->
                        <li><a href="home" class="nav-link px-2 link-dark">Homepage</a></li>
                        <!--<li><a href="regisListAdmin" class="nav-link px-2 link-dark">List Registrations</a></li>-->
                        <!--                        <li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
                                                <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
                                                <li><a href="#" class="nav-link px-2 link-dark">About</a></li>-->
                    </ul>
                </c:if>
                <c:if test="${sessionScope.user ne null and sessionScope.user.getIsAdmin() eq 0}">
                    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="home" class="nav-link px-2 link-dark">Homepage</a></li>
                        <li><a href="registerCar" class="nav-link px-2 link-dark">Register</a></li>
                        <li><a href="regisListUser" class="nav-link px-2 link-dark">List Registrations</a></li>
                        <!--                        <li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
                                                <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
                                                <li><a href="#" class="nav-link px-2 link-dark">About</a></li>-->
                    </ul>
                </c:if>
                <c:if test="${sessionScope.user ne null and sessionScope.user.getIsAdmin() eq 1}">
                    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                        <!--<li><a href="" class="nav-link px-2 link-dark">Register</a></li>-->
                        <li><a href="home" class="nav-link px-2 link-dark">Homepage</a></li>
                        <li><a href="regisListAdmin" class="nav-link px-2 link-dark">List Registrations</a></li>
                        <!--                        <li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
                                                <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
                                                <li><a href="#" class="nav-link px-2 link-dark">About</a></li>-->
                    </ul>
                </c:if>
                <!--                <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                                    <li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
                                    <li><a href="#" class="nav-link px-2 link-dark">Features</a></li>
                                    <li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
                                    <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
                                    <li><a href="#" class="nav-link px-2 link-dark">About</a></li>
                                </ul>-->

                <div class="col-md-3 text-end">
                    <c:if test="${sessionScope.user eq null}">
                        <a href="login"><button type="button" class="btn btn-outline-primary me-2" >Login</button></a>
                        <a href="register"><button type="button" class="btn btn-primary">Sign-up</button></a>
                    </c:if>

                    <c:if test="${sessionScope.user ne null}">
                        <a href="logout"><button type="button" class="btn btn-primary">Logout</button></a>

                    </c:if>
                </div>
            </header>
        </div>
        <div style="padding-bottom: 20px">
            <h1 style="display: flex; align-content: center">List Registrations</h1>
        </div>
        <table class="table align-middle mb-0 bg-white">
            <thead class="bg-light">
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Name Of Car</th>
                    <th>Code Car</th>
                    <th>Status</th>
                    <th>Created At</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${regises}" var="r">
                    <tr>
                        <td>
                            <p class="fw-bold mb-1">${r.id}</p>
                        </td>
                        <td>
                            <p class="fw-normal mb-1">${r.fullname}</p>
                        </td>
                        <td>
                            <p class="fw-normal mb-1">${r.nameOfCar}</p>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${r.accepted eq -1}">
                                    <p class="fw-bold mb-1 text-danger">Not Have</p>
                                </c:when>
                                <c:when test="${r.accepted eq 0}">
                                    <p class="fw-bold mb-1 text-warning">NOT YET</p>
                                </c:when>
                                <c:when test="${r.accepted eq 1}">
                                    <p class="fw-bold mb-1 text-success">${r.codeCar}</p>
                                </c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${r.accepted eq -1}">
                                    <span class="badge badge-error rounded-pill d-inline">Denied</span>
                                </c:when>
                                <c:when test="${r.accepted eq 0}">
                                    <a href="evalute?id=${r.id}&status=1">
                                        <button type="button" class="btn btn-info">Accept</button>
                                    </a>
                                    <a href="evalute?id=${r.id}&status=0">
                                        <button type="button" class="btn btn-danger">Deny</button>
                                    </a>
                                </c:when>
                                <c:when test="${r.accepted eq 1}">
                                    <span class="badge badge-success rounded-pill d-inline">Active</span>
                                </c:when>
                            </c:choose>
                        </td>
                        <td>
                            <p class="fw-normal mb-1">${r.createdAt}</p>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
