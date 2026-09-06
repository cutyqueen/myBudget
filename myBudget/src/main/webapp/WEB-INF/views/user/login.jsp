<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 - 가계부</title>
    
    <!-- MatDash CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.min.css" />
</head>
<body>
    <div class="page-wrapper" id="main-wrapper">
        <div class="body-wrapper">
            <div class="app-container container-fluid">
                <div class="row justify-content-center">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center mb-4">
                                    <a href="${pageContext.request.contextPath}/">
                                        <img src="${pageContext.request.contextPath}/assets/images/logos/dark-logo.svg" alt="가계부" />
                                    </a>
                                    <h4 class="card-title mt-3">로그인</h4>
                                </div>
                                
                                <form action="${pageContext.request.contextPath}/user/login" method="post">
                                    <div class="mb-3">
                                        <label for="userId" class="form-label">아이디</label>
                                        <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력하세요" required />
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="userPassword" class="form-label">비밀번호</label>
                                        <input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="비밀번호를 입력하세요" required />
                                    </div>
                                    
                                    <div class="mb-3">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe" />
                                            <label class="form-check-label" for="rememberMe">아이디 저장</label>
                                        </div>
                                    </div>
                                    
                                    <button type="submit" class="btn btn-primary w-100">로그인</button>
                                </form>
                                
                                <div class="text-center mt-3">
                                    <a href="${pageContext.request.contextPath}/user/sign" class="text-primary">회원가입</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 에러 모달 -->
    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
    <div class="modal fade show" id="errorModal" tabindex="-1" style="display: block; background: rgba(0,0,0,0.5);">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">로그인 실패</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" onclick="location.href='${pageContext.request.contextPath}/user/login'"></button>
                </div>
                <div class="modal-body">
                    <%= error %>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="location.href='${pageContext.request.contextPath}/user/login'">확인</button>
                </div>
            </div>
        </div>
    </div>
    <% } %>
    
    <!-- MatDash JS -->
    <script src="${pageContext.request.contextPath}/assets/js/vendor.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/app.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>