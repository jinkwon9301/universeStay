<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String loginEmail = (String) session.getAttribute("user_email");
%>
<html>
<head>
    <title>withdrawal</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>
<body>
<div class="screens-user-withdrawal__wrapper">
    <h1 class="screens-user-withdrawal__h1">계정 삭제하기</h1>
    <div class="screens-user-withdrawal__info-1">
        개인정보 삭제 요청을 제출하세요.
        계정 소유자임을 확인하기 위해 유니버스스테이에서 이메일(valor9254@gmail.com)로 연락드릴 수 있습니다.
        이메일에 안내된 <br>
        절차를 따르신 후에야 저희 측에서 요청을 진행할 수 있습니다.
    </div>
    <div class="screens-user-withdrawal__info-2">
        계정 삭제 요청과 관련한 안내:
    </div>
    <ul class="screens-user-withdrawal__info-3">
        <li class="screens-user-withdrawal__li">
            지난 60일 이내에 호스트 또는 게스트로서 체크아웃한 적이 있다면, 60일의 청구 기간이 경과할 때까지 삭제 요청이 처리되지 않습니다.
        </li>
        <li class="screens-user-withdrawal__li">요청이 처리되면 유니버스스테이가 보유하고 있는 사용자의 모든 개인정보가 삭제됩니다.
            (단, 개인정보 보호정책에 명시된 대로 법적으로 보관이 필수이거나 허용된 일부 정보는 제외)
        </li>
        <li class="screens-user-withdrawal__li">
            향후 유니버스스테이를 다시 이용하려면 새 계정을 만드셔야 합니다.
        </li>
        <li class="screens-user-withdrawal__li">
            호스트나 게스트로서 예정된 예약이 있는 경우, 삭제 요청을 제출하기 전에 해당 호스트의 환불 정책에 따라 해당 예약을 먼저 취소해야 합니다.
            취소 수수료가 발생할 수 있습니다. 예약 취소에 대한 자세한 내용은 도움말 센터에서 확인하실 수 있습니다.
        </li>
    </ul>

    <div class="screens-user-withdrawal__survey">
        계정을 삭제하려는 이유를 알려주세요.
    </div>

    <div class="screens-user-withdrawal__dropdown">
        <input type="text" class="screens-user-withdrawal__dropdown__textBox"
               placeholder="이유를 선택하세요(선택 사항)." readonly>
        <div class="screens-user-withdrawal__dropdown__option">
            <div onclick="show('유니버스스테이 이용 경험이 불만족스럽습니다.')">
                유니버스스테이 이용 경험이 불만족스럽습니다.
            </div>
            <div onclick="show('유니버스스테이의 개인 데이터 처리 방식에 의구심이 듭니다.')">
                유니버스스테이의 개인 데이터 처리 방식에 의구심이 듭니다.
            </div>
            <div onclick="show('중복 계정을 삭제하려고 합니다.')">
                중복 계정을 삭제하려고 합니다.
            </div>
            <div onclick="show('유니버스스테이 이용 빈도가 낮습니다.')">
                유니버스스테이 이용 빈도가 낮습니다.
            </div>
            <div onclick="show('기타')">
                기타
            </div>
        </div>
    </div>

    <img class="screens-user-withdrawal__img-caution"
         src="../../../../resources/img/symbol/caution.png" alt="">

    <h2 class="screens-user-withdrawal__h2">계정을 삭제하시겠어요?</h2>
    <ul class="screens-user-withdrawal__info-4">
        <li class="screens-user-withdrawal__li">계정 삭제를 요청하시면 더 이상 유니버스스테이 계정을 사용하실 수 없으며, 계정이 영구적으로
            해지됩니다.
        </li>
        <li class="screens-user-withdrawal__li">계정 사용을 일시적으로 중단하고 싶으시다면 유니버스스테이 계정을 비활성화하실 수 있습니다.
        </li>
    </ul>
    <button class="screens-user-withdrawal__btn-unactivate">계정 비활성화</button>
    <div class="screens-user-withdrawal__contour"></div>
    <div class="screens-user-withdrawal__box-back-delete">
        <button class="screens-user-withdrawal__box-back-delete__btn-back">뒤로</button>
        <button class="screens-user-withdrawal__box-back-delete__btn-delete"
                onclick="withdrawalUser()">계정삭제
        </button>
        <%--        <button class="box-back-delete__btn-delete" onclick="withdrawalUser()">계정삭제</button>--%>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/user/footerNotFix.jsp"/>

<script>
  function show(anything) {
    document.querySelector('.screens-user-withdrawal__dropdown__textBox').value = anything;
  }

  let dropdown = document.querySelector('.screens-user-withdrawal__dropdown');

  dropdown.onclick = function () {
    dropdown.classList.toggle('active');
  }

  function withdrawalUser() {
    if (!confirm("정말 삭제하시겠습니까?")) return;

    let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/user/myPage/withdrawal?user_email=<%= loginEmail %>');
    document.body.appendChild(f);
    f.submit();
  }

  const toBackBtn = document.querySelector(".screens-user-withdrawal__box-back-delete__btn-back");
  toBackBtn.addEventListener("click", () => {
    location.href = "/user/myPage/info"
  });
</script>
</body>
</html>
