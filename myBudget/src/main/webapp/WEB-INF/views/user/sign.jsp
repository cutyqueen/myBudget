<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - 가계부</title>
    
    <!-- MatDash CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.min.css" />
</head>
<body>
    <div class="page-wrapper" id="main-wrapper">
        <div class="body-wrapper">
            <div class="app-container container-fluid">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center mb-4">
                                    <a href="${pageContext.request.contextPath}/">
                                        <img src="${pageContext.request.contextPath}/assets/images/logos/dark-logo.svg" alt="가계부" />
                                    </a>
                                    <h4 class="card-title mt-3">회원가입</h4>
                                </div>
                                
                                <form action="${pageContext.request.contextPath}/user/sign" method="post">
                                    <div class="mb-3">
                                        <label for="userId" class="form-label">아이디</label>
                                        <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력하세요" required />
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="userNm" class="form-label">이름</label>
                                        <input type="text" class="form-control" id="userNm" name="userNm" placeholder="이름을 입력하세요" required />
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="pw" class="form-label">비밀번호</label>
                                        <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력하세요" required />
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="email" class="form-label">이메일</label>
                                        <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" />
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="mbpn" class="form-label">전화번호</label>
                                        <input type="tel" class="form-control" id="mbpn" name="mbpn" placeholder="010-1234-5678" />
                                    </div>
                                    
                                    <button type="submit" class="btn btn-primary w-100">회원가입</button>
                                </form>
                                
                                <div class="text-center mt-3">
                                    <a href="${pageContext.request.contextPath}/user/login" class="text-primary">로그인</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 회원가입 완료 모달 -->
    <% String success = (String) request.getAttribute("success"); %>
    <% if (success != null) { %>
    <div class="modal fade show" id="successModal" tabindex="-1" style="display: block; background: rgba(0,0,0,0.5);">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">회원가입 완료</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" onclick="location.href='${pageContext.request.contextPath}/user/login'"></button>
                </div>
                <div class="modal-body text-center">
                    <i class="ti ti-check fs-8 text-success"></i>
                    <p class="mt-2">회원가입이 완료되었습니다!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="location.href='${pageContext.request.contextPath}/user/login'">로그인</button>
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