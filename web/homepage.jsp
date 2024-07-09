<%-- 
    Document   : homepage
    Created on : Mar 4, 2024, 4:56:39 AM
    Author     : nocol
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Homepage</title>
        <style>
            body{
                background: #000
            }
            .card{
                border: none;
                height: 320px
            }
            .forms-inputs{
                position: relative;
                width: 100%;
            }
            .forms-inputs span{
                position: absolute;
                top:-18px;
                left: 10px;
                background-color: #fff;
                padding: 5px 10px;
                font-size: 15px
            }
            .forms-inputs input{
                height: 50px;
                border: 2px solid #eee;
                width: 100%;
            }
            .forms-inputs input:focus{
                box-shadow: none;
                outline: none;
                border: 2px solid #000
            }
            .btn{
                height: 50px
            }
            .success-data{
                display: flex;
                flex-direction: column
            }
            .bxs-badge-check{
                font-size: 90px
            }
        </style>
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
        <div class="container mt-5" style="font-color: white">
            <div class="row d-flex justify-content-center text-light" style="font-color: white">
                <div class="col-sm-12 col-xs-12"> 
                    <div class="head"> 
                        <div class="pull-left" style="width:100%"> 
                            <h1 class="main-title -none"></h1>
                            <h1 class="main-title -none" style="margin-bottom: 10px;">Đăng ký, cấp biển số xe lần đầu</h1>  
                        </div> 
                        <div class="clearfix"></div> 
                    </div> 
                    <div class="divider-gray"></div> 
                    <h2 class="main-title-sub">Trình tự thực hiện</h2>
                    <div class="list-expand">
                        <div>
                            <div class="item active">
                                <div class="title" title=" "> 
                                </div>
                                <div class="content">
                                    <p>Bước 1: Chủ xe đăng nhập cổng dịch vụ công kê khai các thông tin vào Giấy khai đăng ký xe điện tử (theo mẫu số 01A/58) và nhận mã số thứ tự, lịch hẹn giải quyết hồ sơ qua địa chỉ thư điện tử hoặc qua tin nhắn điện thoại để làm thủ tục đăng ký xe tại cơ quan đăng ký xe. <br>Bước 2: Đến Phòng Cảnh sát giao thông và cán bộ đăng ký xe tiếp nhận và nhập mã hồ sơ đăng ký trực tuyến của chủ xe trên hệ thống đăng ký, quản lý xe để kiểm tra thông tin khai báo đăng ký trực tuyến của chủ xe; in Giấy khai đăng ký xe điện tử trên hệ thống. <br>Trực tiếp nộp hồ sơ đăng ký xe tại cơ quan đăng ký xe thì khai giấy khai đăng ký xe (mẫu 01) theo quy định. <br>Bước 3: Hướng dẫn chủ xe ký và ghi rõ họ tên vào Giấy khai đăng ký xe và dán bản chà số máy, số khung của xe vào Giấy khai đăng ký xe điện tử. <br>Bước 4: Kiểm tra thông tin của chủ xe: <br>Nhập số căn cước công dân, họ tên của chủ xe (đối với cá nhân), đổ dữ liệu căn cước công dân truyền sang cơ sở dữ liệu đăng ký xe; kiểm tra, đối chiếu thông tin cá nhân của chủ xe: tên, địa chỉ chủ xe với nội dung thông tin về căn cước công dân trong Giấy khai đăng ký xe điện tử với giấy tờ của xe. <br>Kiểm tra, đối chiếu giấy tờ của người đến làm thủ tục đăng ký xe (đối với cơ quan, tổ chức). <br>Bước 5: Hóa đơn điện tử: <br>Truy cập hệ thống đăng ký, quản lý xe, nhập mã xác thực hóa đơn điện tử ghi tại Giấy khai đăng ký xe điện tử để kiểm tra thông tin hóa đơn điện tử, in hóa đơn điện tử và kiểm tra, đối chiếu thông tin, nội dung hóa đơn điện tử: Doanh nghiệp bán xe, địa chỉ, người mua xe và đặc điểm, thông số của xe với hồ sơ xe. Trường hợp chưa kết nối, chia sẻ dữ liệu hóa đơn điện tử thì yêu cầu chủ xe nộp hóa đơn bán xe theo quy định. <br> Bước 6: Chứng từ lệ phí trước bạ điện tử: <br>Truy cập hệ thống đăng ký, quản lý xe, tìm kiếm mã hồ sơ lệ phí trước bạ điện tử ghi tại Giấy khai đăng ký xe điện tử; tải và in dữ liệu điện tử lệ phí trước bạ và kiểm tra, đối chiếu nội dung hoàn thành nghĩa vụ nộp lệ phí trước bạ điện tử: thông tin của chủ xe (tên, địa chỉ), thông tin của xe (nhãn hiệu, số loại, số máy, số khung, loại xe), biển số xe (nếu có), giá trị tài sản tính lệ phí trước bạ, số tiền lệ phí trước bạ, ngày nộp lệ phí trước bạ với hồ sơ xe. <br> Bước 7: Chứng từ nguồn gốc điện tử: <br>Truy cập hệ thống đăng ký, quản lý xe, tìm kiếm chứng từ nguồn gốc của xe ghi tại Giấy khai đăng ký xe điện tử, tải và in dữ liệu điện tử về chứng từ nguồn gốc của xe. Kiểm tra, đối chiếu nội dung thông tin dữ liệu tờ khai hải quan điện tử, thông tin dữ liệu xe sản xuất lắp ráp trong nước với nội dung ghi tại Giấy khai đăng ký xe điện tử và hồ sơ xe. <br>Bước 8: Trường hợp hồ sơ không đảm bảo thủ tục theo quy định, thông tin dữ liệu điện tử không đầy đủ, không đúng so với hồ sơ xe hoặc không có thông tin dữ liệu điện tử: cán bộ đăng ký phải hướng dẫn cụ thể, đầy đủ một lần và ghi nội dung bổ sung vào Phiếu hướng dẫn bổ sung thủ tục đăng ký xe; ký, ghi rõ họ tên và chịu trách nhiệm về hướng dẫn đó. <br>Bước 9: <br>a) Trực tiếp đối chiếu nội dung trong giấy khai đăng ký xe với thực tế xe, gồm: Nhãn hiệu, loại xe, số máy, số khung, màu sơn, số chỗ ngồi, số chỗ đứng, số chỗ nằm, năm sản xuất, tải trọng và các thông số kỹ thuật khác; kiểm tra toàn bộ, chi tiết hình dáng kích thước, tổng thành khung, tổng thành máy của xe; <br>Trường hợp cơ quan Hải quan xác nhận xe chỉ có số VIN, không có số máy, số khung thì lấy số VIN thay thế cho số khung (chụp ảnh số VIN thay thế cho bản chà số khung), đóng số máy theo biển số. <br>Bước 10: Nhập thông tin chủ xe, thông tin xe vào hệ thống đăng ký, quản lý xe; cập nhật trạng thái: xe tạm nhập tái xuất, xe miễn thuế, xe được cơ quan đăng ký giải quyết đóng lại số khung, số máy (nếu có), xe thế chấp ngân hàng. <br>Bước 11: Hướng dẫn chủ xe kiểm tra thông tin: Chủ xe và xe, cấp biển số ngẫu nhiên trên hệ thống đăng ký, quản lý xe theo quy định; ghi biển số vào giấy khai đăng ký xe. <br>Bước 12: Cấp giấy hẹn cho chủ xe; trường hợp chủ xe có yêu cầu chuyển chứng nhận đăng ký xe qua Bưu điện thì hướng dẫn chủ xe làm thủ tục đăng ký sử dụng dịch vụ chuyển phát chứng nhận đăng ký xe. <br>Bước 13: Thu lệ phí đăng ký xe theo quy định. <br>Bước 14: Trả biển số xe (hướng dẫn chủ xe lắp biển số vào vị trí theo thiết kế của xe); trường hợp xe ô tô chỉ lắp được 2 biển số dài hoặc 1 biển ngắn và 1 biển dài thì cho đổi biển số xe, kinh phí chủ xe chi trả theo quy định. <br>Bước 15: Hướng dẫn chủ xe kẻ, ghi biển số, khối lượng chuyên chở, khối lượng bản thân, tên chủ xe đối với các loại xe ô tô theo quy định.</p>
                                </div>
                            </div>
                        </div>
                    </div> 
                    <div class="divider-gray"></div> 
                    <h2 class="main-title-sub">Cách thức thực hiện</h2>
                    <br>
                    <table class="table-result-tthc table-result">  
                        <thead>
                            <tr>
                                <th>Hình thức nộp</th>
                                <th>Thời hạn giải quyết</th>
                                <th>Phí, lệ phí</th>
                                <th>Mô tả</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="text-align: left;" data-title="Hình thức nộp">Trực tiếp</td>
                                <td data-title="Thời hạn giải quyết">02 Ngày làm việc</td>
                                <td style="min-width: 130px;text-align: left;" data-title="Phí, lệ phí"><li>Phí: Đồng<a class="linkVM" onclick="showMoreDes(543437)">Xem chi tiết</a></li></td>
                        <td style="min-width:180px" data-title="Mô tả">+ Trực tiếp tại trụ sở trụ sở Phòng Cảnh sát giao thông Công an tỉnh, thành phố trực thuộc Trung ương hoặc các điểm đăng ký xe của Phòng. Thời gian: Từ thứ 2 đến thứ 7 (theo quy định của Thủ tướng Chính phủ). <br> <br>Thời hạn giải quyết: Cấp ngay biển số sau khi tiếp nhận hồ sơ đăng ký xe hợp lệ; cấp giấy chứng nhận đăng ký xe thì thời hạn hoàn thành thủ tục không quá 2 ngày làm việc, kể từ ngày nhận đủ hồ sơ hợp lệ. <br> <br>Cấp ngay biển số sau khi tiếp nhận hồ sơ đăng ký xe hợp lệ; cấp giấy chứng nhận đăng ký xe thì thời hạn hoàn thành thủ tục không quá 2 ngày làm việc, kể từ ngày nhận hồ sơ hợp lệ.</td>
                        </tr>
                        <tr>
                            <td style="text-align: left;" data-title="Hình thức nộp">Trực tuyến</td>
                            <td data-title="Thời hạn giải quyết">02 Ngày làm việc</td>
                            <td style="min-width: 130px;text-align: left;" data-title="Phí, lệ phí"><li>Phí: Đồng<a class="linkVM" onclick="showMoreDes(543438)">Xem chi tiết</a></li></td>
                        <td style="min-width:180px" data-title="Mô tả">+ Nộp Giấy khai đăng ký xe điện tử trên Cổng Dịch vụ công quốc gia hoặc Cổng dịch vụ công Bộ Công an.</td>
                        </tr>
                        <tr>
                            <td style="text-align: left;" data-title="Hình thức nộp">Dịch vụ bưu chính</td>
                            <td data-title="Thời hạn giải quyết">02 Ngày làm việc</td>
                            <td style="min-width: 130px;text-align: left;" data-title="Phí, lệ phí"><li>Phí: Đồng<a class="linkVM" onclick="showMoreDes(543439)">Xem chi tiết</a></li></td>
                        <td style="min-width:180px" data-title="Mô tả">+ Trả kết quả qua dịch vụ bưu chính.</td>
                        </tr>
                        </tbody>
                    </table> 
                </div>
            </div>
        </div>
    </body>
</html>
