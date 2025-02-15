<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:eval expression="@OauthProperties['KAKAO_JavaScript_KEY']" var="KakaoApiKey"/>
<%
    String isHost = (String) request.getAttribute("isHost");
%>
<html>
<head>
    <title>RoomEnroll</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>
<body>

<%--<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>--%>
<header class="components-user-header__header">
    <div class="components-user-header__header__inner">

        <!-- 헤더 로고 영역-->
        <div class="components-user-header__header__logo" onclick="location.href ='/'">
            <img class="components-user-header__logo"
                 src="/resources/img/logo/small_logo_no_bgd2.png"/>
        </div>
    </div>
    <!--메뉴 영역-->
    <div class="components-user-header__header__searchbar">
        <div class="components-user-header__header__searchbar__inner">
            <div class="screens-room-management__menuButton-box">
                <button onclick="location.href='/room/management'"><h2>숙소</h2></button>
            </div>
            <div class="screens-room-management__menuButton-box">
                <button onclick="location.href='/user/myPage/hostbookingmanagement'"><h2>예약</h2>
                </button>
            </div>
            <div class="screens-room-management__menuButton-box">
                <button onclick="location.href='#'"><h2>달력</h2></button>
            </div>
            <div class="screens-room-management__menuButton-box">
                <button onclick="location.href='/chatting/chattingRoomList'"><h2>메세지</h2></button>
            </div>
            <div class="screens-room-management__menuButton-box">
                <button onclick="location.href='#'"><h2>메뉴</h2></button>
            </div>
        </div>
    </div>


    <!--헤더 프로필 영역-->
    <div class="components-user-header__header__profile">
        <div class="components-user-header__header__profile__to-host">

            <% if ("Y".equals(isHost)) { %>
            <a class="components-user-header__a" href="/">
                <div>게스트 모드로 전환</div>
            </a>
            <% } %>

        </div>

        <div class="components-user-header__header__profile__my-profile components-user-header__dropdown">
            <button class="components-user-header__header__profile__my-profile__btn components-user-header__button">
                <div components-user-header__header__profile__my-profile__wrapper>
                    <img class="components-user-header__header__profile__hamburger"
                         src="/resources/img/user/bars-3.png"/>
                    <% //세션에 'user_email'이라는 값이 저장되어 있으면? (즉, 로그인 상태면) 아래 드롭다운을 보여준다.
                        if
                        (session.getAttribute("user_email") != null) {
                    %>
                    <img class="components-user-header__header__profile__img"
                         src="${profileImgUrl}"/>
                    <%
                    } else {
                    %>
                    <img class="components-user-header__header__profile__img"
                         src="/resources/img/user/default_profile_icon.png"/>
                    <%}%>
                </div>

                <%-- 마이프로필 버튼 눌렀을때 나오는 드롭다운--%>
                <div class="components-user-header__header__profile__option components-user-header__dropdown-div">

                    <% //세션에 'user_email'이라는 값이 저장되어 있으면? (즉, 로그인 상태면) 아래 드롭다운을 보여준다.
                        if
                        (session.getAttribute("user_email") != null) {
                    %>
                    <div class="components-user-header__dropdown__option dropdown__option-msg">
                        <span>메시지</span>
                    </div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-reservation"
                         onclick="location.href = '/user/myPage/mybookings/'">
                        <span>여행</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-wishlist"
                         onclick="location.href ='/user/wishLists'">
                        <span>위시리스트</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-reviews">
                        <span>나의 리뷰</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-coupon">
                        <span>나의 쿠폰</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-notice">
                        <span>공지사항</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-event"
                         onclick="location.href ='/event'">
                        <span>이벤트</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-account"
                         onclick="location.href ='/user/myPage/info'">
                        <span>계정</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-log-out"
                         onclick="location.href ='/user/userLogout'">
                        <span>로그아웃</span></div>
                    <%
                    } else  //세션에 'user_email'이라는 값이 저장되어 있지 않으면(즉, 로그아웃 상태면) 아래 드롭다운을 보여준다.
                    {
                    %>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-sign-up">
                        <span>회원가입</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-sign-in">
                        <span>로그인</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-notice">
                        <span>공지사항</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-event"
                         onclick="location.href ='/event'">
                        <span>이벤트</span></div>
                    <%}%>
                </div>
            </button>
        </div>
    </div>

    </div>

</header>
<div class="components-user-header__line"></div>

<form action="/room/enroll" method="post" class="screens-room-roomEnroll__wrapper">

    <%--  숙소 유형을 선택하세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 유형을 선택하세요 <span
            class="screens-room-roomEnroll__required-input">(필수 입력)</span></div>
    <div class="screens-room-roomEnroll__dropdown">
        <input name="" type="text" class="screens-room-roomEnroll__dropdown__textBox"
               placeholder="숙소 유형을 선택하세요" readonly>
        <input name="room_category_id" type="hidden"
               class="screens-room-roomEnroll__dropdown__valueBox">
        <div class="screens-room-roomEnroll__dropdown__option">
            <div onclick="show('아파트')">
                아파트
            </div>
            <div onclick="show('주택')">
                주택
            </div>
            <div onclick="show('별채')">
                별채
            </div>
            <div onclick="show('호텔')">
                호텔
            </div>
            <div onclick="show('모텔')">
                모텔
            </div>
            <div onclick="show('펜션')">
                펜션
            </div>
            <div onclick="show('콘도')">
                콘도
            </div>
            <div onclick="show('레지던스')">
                레지던스
            </div>
            <div onclick="show('오피스텔')">
                오피스텔
            </div>
            <div onclick="show('한옥')">
                한옥
            </div>
            <div onclick="show('캠핑장/아웃도어')">
                캠핑장/아웃도어
            </div>
            <div onclick="show('호스텔')">
                호스텔
            </div>
            <div onclick="show('리조트')">
                리조트
            </div>
        </div>
    </div>

    <%--  숙소의 위치는 어디인가요?  --%>
    <div class="screens-room-roomEnroll__title">숙소의 위치는 어디인가요? <span
            class="screens-room-roomEnroll__required-input">(필수 입력)</span></div>
    <div class="screens-room-roomEnroll__input__address">
        <input type="text" name="room_address" class="screens-room-roomEnroll__address-main"
               placeholder="주소" readonly>
        <input type="button" class="screens-room-roomEnroll__btn-address-main"
               onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
        <input type="text" name="room_address_detail"
               class="screens-room-roomEnroll__address-detail" placeholder="상세 주소 입력 (선택)"><br>
        <div class="screens-room-roomEnroll__map"
             style="width:100%;height:300px;margin-top:10px;display:none"></div>
    </div>

    <%--  숙소 기본정보를 알려주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 기본정보를 알려주세요 <span
            class="screens-room-roomEnroll__required-input">(필수 입력)</span></div>
    <div class="screens-room-roomEnroll__sub-title">침대 유형과 같은 세부 사항은 나중에 추가하실 수 있습니다.</div>
    <div class="screens-room-roomEnroll__info-basic">
        <div class="screens-room-roomEnroll__info-basic__partition">
            <span class="screens-room-roomEnroll__info-basic__info-1">게스트</span>
            <div class="screens-room-roomEnroll__info-basic__info-2">
                <button type="button" class="screens-room-roomEnroll__info-basic__btn-minus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
                    </svg>
                </button>
                <input type="text" class="screens-room-roomEnroll__info-basic__num"
                       name="room_standard_capa" value='4' readonly/>
                <button type="button" class="screens-room-roomEnroll__info-basic__btn-plus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
                    </svg>
                </button>
            </div>
        </div>
        <div class="screens-room-roomEnroll__info-basic__partition">
            <span class="screens-room-roomEnroll__info-basic__info-1">최대 게스트</span>
            <div class="screens-room-roomEnroll__info-basic__info-2">
                <button type="button" class="screens-room-roomEnroll__info-basic__btn-minus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
                    </svg>
                </button>
                <input type="text" class="screens-room-roomEnroll__info-basic__num"
                       name="room_max_capa" value='4' readonly/>
                <button type="button" class="screens-room-roomEnroll__info-basic__btn-plus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
                    </svg>
                </button>
            </div>
        </div>
        <div class="screens-room-roomEnroll__info-basic__partition">
            <span class="screens-room-roomEnroll__info-basic__info-1">침실</span>
            <div class="screens-room-roomEnroll__info-basic__info-2">
                <button type="button" class="screens-room-roomEnroll__info-basic__btn-minus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
                    </svg>
                </button>
                <input type="text" class="screens-room-roomEnroll__info-basic__num"
                       name="room_bedroom_cnt" value='2' readonly/>
                <button type="button" class="screens-room-roomEnroll__info-basic__btn-plus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
                    </svg>
                </button>
            </div>
        </div>
        <div class="screens-room-roomEnroll__info-basic__partition">
            <span class="screens-room-roomEnroll__info-basic__info-1">침대</span>
            <div class="screens-room-roomEnroll__info-basic__info-2">
                <button type="button" class="screens-room-roomEnroll__info-basic__btn-minus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
                    </svg>
                </button>
                <input type="text" class="screens-room-roomEnroll__info-basic__num"
                       name="room_bed_cnt" value='2' readonly/>
                <button type="button" class="screens-room-roomEnroll__info-basic__btn-plus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
                    </svg>
                </button>
            </div>
        </div>
        <div class="screens-room-roomEnroll__info-basic__partition">
            <span class="screens-room-roomEnroll__info-basic__info-1">욕실</span>
            <div class="screens-room-roomEnroll__info-basic__info-2">
                <button type="button" class="screens-room-roomEnroll__info-basic__btn-minus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
                    </svg>
                </button>
                <input type="text" class="screens-room-roomEnroll__info-basic__num"
                       name="room_bathroom_cnt" value='2' readonly/>
                <button type="button" class="screens-room-roomEnroll__info-basic__btn-plus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
                    </svg>
                </button>
            </div>
        </div>
    </div>

    <%--  숙소 편의시설 정보를 추가하세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 편의시설 정보를 추가하세요</div>
    <div class="screens-room-roomEnroll__sub-title">
        여기에 추가하려는 편의시설이 보이지 않더라도 걱정하지 마세요! 숙소를 등록한 후에
        편의시설을 추가할 수 있습니다.
    </div>
    <div class="screens-room-roomEnroll__facilities">
        <div>욕실</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M7.5 2a4.5 4.5 0 0 1 4.47 4H14v2H8V6h1.95A2.5 2.5 0 0 0 5 6.34V16h26v2h-2v5a5 5 0 0 1-3 4.58V30h-2v-2H8v2H6v-2.42a5 5 0 0 1-3-4.34V18H1v-2h2V6.5A4.5 4.5 0 0 1 7.5 2zM27 18H5v5a3 3 0 0 0 2.65 2.98l.17.01L8 26h16a3 3 0 0 0 3-2.82V23z"></path>
                    </svg>
                    욕조
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M10 2a3 3 0 0 1 3 2.82V16h14a1 1 0 0 1 1 .88V17a8 8 0 0 1-7.75 8h-4.77l1.45 3.63a1 1 0 0 1-.7 1.35l-.11.01L16 30H4a1 1 0 0 1-1-.88V5a3 3 0 0 1 2.82-3H10zm15.91 16H5v10h9.52l-1.45-3.63a1 1 0 0 1 .7-1.35l.11-.01L14 23h6a6 6 0 0 0 5.85-4.67l.05-.23.01-.1zM10 4H6a1 1 0 0 0-1 .88V16h6V5a1 1 0 0 0-.77-.97L10.12 4 10 4zm11 9a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-8 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm6-2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM8 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
                    </svg>
                    비데
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M18 1v2h-7v2h1a2 2 0 0 1 2 1.85V9.1a5 5 0 0 1 4 4.67V28a3 3 0 0 1-2.82 3H5a3 3 0 0 1-3-2.82V14a5 5 0 0 1 4-4.9V7a2 2 0 0 1 1.85-2H9V3H6V1h12zm-2 15.06c-1.14.15-2.08.6-3.58 1.55l-.34.23C9.63 19.41 8.29 20 6 20a9 9 0 0 1-2-.22V28a1 1 0 0 0 .88 1H15a1 1 0 0 0 1-.88V16.06zM27 13a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm-14-2H7a3 3 0 0 0-3 2.82v3.89A6.85 6.85 0 0 0 6 18c1.63 0 2.64-.36 4.4-1.46l.64-.4c2.01-1.32 3.28-1.93 4.96-2.09V14a3 3 0 0 0-3-3zm14 4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM25 2a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM12 7H8v2h4V7zm13-3a2 2 0 1 0 0 4 2 2 0 0 0 0-4z"></path>
                    </svg>
                    바디클렌저
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M16 1c4.26 0 7.6 4.44 7.97 10h.91a2 2 0 0 1 2 2v.22l-1.79 16A2 2 0 0 1 23.26 31l-.16.01H8.9a2 2 0 0 1-1.97-1.62l-.02-.16L6.44 25H5a2 2 0 0 1-2-1.85V14a5 5 0 0 1 4.78-5h.52c.94-4.62 4-8 7.7-8zm8.21 18H17v4a2 2 0 0 1-1.85 2h-6.7l.45 4h14.2zM15 21H5v2h10zm0-10H8a3 3 0 0 0-3 2.82V19h10zm9.88 2H17v4h7.44zM16 3c-2.52 0-4.8 2.44-5.65 6H15a2 2 0 0 1 2 1.85V11h4.96c-.34-4.55-2.95-8-5.96-8z"></path>
                    </svg>
                    청소용품
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M20 1v2h-3v2h1a2 2 0 0 1 2 1.85V9a4 4 0 0 1 4 3.8V27a4 4 0 0 1-3.8 4H12a4 4 0 0 1-4-3.8V13a4 4 0 0 1 3.8-4h.2V7a2 2 0 0 1 1.85-2H15V3H8V1zm2 21H10v5a2 2 0 0 0 1.85 2H20a2 2 0 0 0 2-1.85V27zm0-6H10v4h12zm-2-5h-8a2 2 0 0 0-2 1.85V14h12v-1a2 2 0 0 0-2-2zm-2-4h-4v2h4z"></path>
                    </svg>
                    컨디셔너
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M14 27v.2a4 4 0 0 1-3.8 3.8H4v-2h6.15a2 2 0 0 0 1.84-1.84L12 27zM10 1c.54 0 1.07.05 1.58.14l.38.07 17.45 3.65a2 2 0 0 1 1.58 1.79l.01.16v6.38a2 2 0 0 1-1.43 1.91l-.16.04-13.55 2.83 1.76 6.5A2 2 0 0 1 15.87 27l-.18.01h-3.93a2 2 0 0 1-1.88-1.32l-.05-.15-1.88-6.76A9 9 0 0 1 10 1zm5.7 24-1.8-6.62-1.81.38a9 9 0 0 1-1.67.23h-.33L11.76 25zM10 3a7 7 0 1 0 1.32 13.88l.33-.07L29 13.18V6.8L11.54 3.17A7.03 7.03 0 0 0 10 3zm0 2a5 5 0 1 1 0 10 5 5 0 0 1 0-10zm0 2a3 3 0 1 0 0 6 3 3 0 0 0 0-6z"></path>
                    </svg>
                    헤어드라이어
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="m4 2v2h2l.001 2h-1.001c-1.1045695 0-2 .8954305-2 2v16.3846154c0 3.0720253 2.20424471 5.6153846 5 5.6153846h16c2.7957553 0 5-2.5433593 5-5.6153846v-9.3846154h-2l.0006267 2.2441864c-.2957862.1662973-.6415947.2556548-1.0003023.2558136-.3770726-.0001668-.7397707-.0987428-1.0448826-.2813581l-.147435-.0980881-.0698054-.0542225-.0669618-.0575717c-.1674894-.1516722-.3473184-.2870627-.5370123-.4056091-.1267551-.0791722-.2576057-.1507019-.3921007-.2145789l-.2041007-.0899647c-.4828805-.1966888-1.005996-.2986069-1.537908-.2986069-.1521835 0-.3034078.0083174-.453179.0247859l-.2234033.0307902c-.658505.1092272-1.2810008.3778141-1.8035225.7911936l-.1911344.1617761c-.3493432.3161496-.8261929.4912319-1.3293208.4914542-.5021258-.0002223-.9789755-.1753046-1.3283187-.4914542-.7261733-.6571745-1.6832835-1.0085458-2.6712392-1.0085458-.9878365 0-1.9453342.3515135-2.6706493 1.008332-.3497754.3163381-.8267557.4914457-1.3290263.491668-.502832-.0002223-.97980321-.1753492-1.32908476-.4912404-.72578749-.6572461-1.68328523-1.0087596-2.67112174-1.0087596-.34005846 0-.67646247.0416292-1.00105227.1230294l.00093437-8.1230294h4v2h2v-2c0-1.1045695-.8954305-2-2-2h-.999l-.001-2.001 2 .001v-2zm22.0003242 17.4999999c.3396204-.0001501.6755904-.0417799.9997827-.1230407v5.0076562c0 2.0259877-1.3775842 3.6153845-3.0001069 3.6153845h-16c-1.62252271 0-3-1.5893968-3-3.6153845l-.00148637-6.1285018c.29592169-.1666518.64208407-.2561137 1.00160427-.2561137.5026133 0 .97950576.1750753 1.32911493.4916681.72598912.6565871 1.68280283 1.0078952 2.67109137 1.0083319.9877-.0004367 1.9445263-.3517037 2.6710333-1.0087595.3491367-.3161652.8260292-.4912405 1.3286425-.4912405.5028479 0 .9795643.1750107 1.3292324.4914543.725724.6567679 1.6826278 1.008109 2.6713278 1.0085457.987581-.0004368 1.9447946-.351846 2.6704432-1.0085457.3496467-.3164242.826354-.4914543 1.3288787-.4914543.5028479 0 .9795643.1750107 1.3292324.4914543.6698295.6061843 1.5369688.9522395 2.4431705 1.0022354zm-8.0059505-15.50004556-1.999421.00109132c.0017379 1.66765868-.3914074 2.67484348-1.6096005 4.57626989l-.4357339.67326735c-1.1985316 1.8730246-1.7578573 3.1084741-1.9072678 4.7489216l2.013841.0007885c.1565646-1.2622433.6616712-2.2705308 1.7787146-3.9820993l.243287-.37580218c1.405662-2.19695557 1.9189882-3.50550246 1.9161806-5.64243718zm3.0005862.00002214c-.0019426 1.6881104-.3993036 2.69826243-1.6537336 4.66840333l-.3870791.60284703c-1.2033592 1.89238746-1.7606515 3.11545826-1.9109072 4.72843796h2.0148819c.1395749-1.0872185.5479182-1.9947141 1.4095297-3.3786139l.7616667-1.19781229c1.2938583-2.07979737 1.7634695-3.36210955 1.7656416-5.42219097zm5 0c-.0019426 1.6881104-.3993036 2.69826243-1.6537336 4.66840333l-.3870791.60284703c-1.2033592 1.89238746-1.7606515 3.11545826-1.9109072 4.72843796h2.0148819c.1395749-1.0872185.5479182-1.9947141 1.4095297-3.3786139l.7616667-1.19781229c1.2938583-2.07979737 1.7634695-3.36210955 1.7656416-5.42219097z"></path>
                    </svg>
                    온수
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M7 1a3 3 0 0 0-3 2.82V31h2V4a1 1 0 0 1 .88-1H18a1 1 0 0 1 1 .88V5h-5a1 1 0 0 0-1 .88V9h-3v2h19V9h-2V6a1 1 0 0 0-.88-1H21V4a3 3 0 0 0-2.82-3H7zm13 28a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5-4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5-4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5-4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5-4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM15 7h10v2H15V7z"></path>
                    </svg>
                    야외
                    샤워 시설
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M20 1v2h-3v2h1a2 2 0 0 1 2 1.85V9a4 4 0 0 1 4 3.8V27a4 4 0 0 1-3.8 4H12a4 4 0 0 1-4-3.8V13a4 4 0 0 1 3.8-4h.2V7a2 2 0 0 1 1.85-2H15V3H8V1zm2 21H10v5a2 2 0 0 0 1.85 2H20a2 2 0 0 0 2-1.85V27zm0-6H10v4h12zm-2-5h-8a2 2 0 0 0-2 1.85V14h12v-1a2 2 0 0 0-2-2zm-2-4h-4v2h4z"></path>
                    </svg>
                    샴푸
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_bath" class="screens-room-roomEnroll__facility"
               value="0">

        <div>침실 및 세탁시설</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M11 1v7l1.9 20.82v.17a2.01 2.01 0 0 1-1.81 2 2 2 0 0 1-.18.01H2.92a2.01 2.01 0 0 1-1.82-2v-.09l1.9-21V1zm6 0h.15a2 2 0 0 1 1.84 1.84L19 3v7.12l-2 8V31h-2V17.96l.03-.16.03-.16L16.72 11H13V1zm11 0a2 2 0 0 1 2 1.85V29a2 2 0 0 1-1.85 2H21v-2h7v-2h-7v-2h7v-2h-7v-2h7v-2h-7v-2h7v-2h-7v-2h7v-2h-7V9h7V7h-7V5h7V3h-7V1zM9.09 9H4.9L3.1 29h7.81v-.06zM17 3h-2v6h2zM9 3H5v4h4z"></path>
                    </svg>
                    필수품목(수건, 침대시트, 비누, 화장지, 베개)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M19.59 2a2 2 0 0 1 1.28.47l.13.12L29.41 11a2 2 0 0 1 .58 1.24l.01.17V25a5 5 0 0 1-4.78 5H4a2 2 0 0 1-2-1.85V7a5 5 0 0 1 4.78-5H7zM7 4a3 3 0 0 0-3 2.82V21a3 3 0 0 0 2.82 3H26v2H7a4.98 4.98 0 0 1-3-1v3h21a3 3 0 0 0 3-2.82V22H6v-2h22v-6h-5a5 5 0 0 1-5-4.78V4zm20.59 8L20 4.42V9a3 3 0 0 0 2.82 3H23z"></path>
                    </svg>
                    침구
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M25 1a3 3 0 0 1 3 2.82V26a3 3 0 0 1-2.82 3H25v2h-2v-2H9v2H7v-2a3 3 0 0 1-3-2.82V4a3 3 0 0 1 2.82-3H25zm1 20H6v5a1 1 0 0 0 .88 1H25a1 1 0 0 0 1-.88V21zm-10 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm9-20h-8v16h9V4a1 1 0 0 0-.88-1H25zM15 3H7a1 1 0 0 0-1 .88V19h9V3zm-3 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm8 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
                    </svg>
                    의류 보관 공간
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M26.29 2a3 3 0 0 1 2.96 2.58c.5 3.56.75 7.37.75 11.42s-.25 7.86-.75 11.42a3 3 0 0 1-2.79 2.57l-.17.01H5.7a3 3 0 0 1-2.96-2.58C2.25 23.86 2 20.05 2 16s.25-7.86.75-11.42a3 3 0 0 1 2.79-2.57L5.7 2zm0 2H5.72a1 1 0 0 0-1 .86A80.6 80.6 0 0 0 4 16c0 3.96.24 7.67.73 11.14a1 1 0 0 0 .87.85l.11.01h20.57a1 1 0 0 0 1-.86c.48-3.47.72-7.18.72-11.14 0-3.96-.24-7.67-.73-11.14a1 1 0 0 0-.87-.85zM16 7a9 9 0 1 1 0 18 9 9 0 0 1 0-18zm0 2a7 7 0 1 0 0 14 7 7 0 0 0 0-14zm-4.8 5.58c1.36.2 2.64.8 3.68 1.75l.46.45a8.97 8.97 0 0 0 4.62 2.28 5.02 5.02 0 0 1-2.01 1.55 10.98 10.98 0 0 1-4.26-2.65 4.96 4.96 0 0 0-2.66-1.38 4.68 4.68 0 0 1 .17-2zm3.09-3.28c1.34.55 2.58 1.36 3.64 2.42a4.97 4.97 0 0 0 3 1.44 4.99 4.99 0 0 1-.07 2 6.97 6.97 0 0 1-4.11-1.8l-.47-.45a8.96 8.96 0 0 0-4.07-2.17 5 5 0 0 1 2.08-1.44zM7 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
                    </svg>
                    건조기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M16 2a5 5 0 0 1 1.66 9.72 1 1 0 0 0-.65.81l-.01.13v.81l13.23 9.05a3 3 0 0 1 1.3 2.28v.2a3 3 0 0 1-3 3H3.47a3 3 0 0 1-1.69-5.48L15 13.47v-.81a3 3 0 0 1 1.82-2.76l.17-.07a3 3 0 1 0-3.99-3V7h-2a5 5 0 0 1 5-5zm0 13.21L2.9 24.17A1 1 0 0 0 3.46 26h25.07a1 1 0 0 0 .57-1.82z"></path>
                    </svg>
                    의류 건조대
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M26.8 4a3 3 0 0 0-1.87.83l-.02.02-.11-.02A47.19 47.19 0 0 0 7.94 4.7l-.85.15-.02-.02A3 3 0 0 0 2 7v.21a3 3 0 0 0 .56 1.54l.03.03-.05.28a44.99 44.99 0 0 0 0 13.88l.05.28-.03.03A3 3 0 0 0 5 28h.2a3 3 0 0 0 1.87-.83l.02-.02.11.02a47.19 47.19 0 0 0 16.86.13l.85-.15.02.02A3 3 0 0 0 30 25v-.21a3 3 0 0 0-.56-1.54l-.03-.03.05-.28c.71-4.74.72-9.16 0-13.88l-.05-.28.03-.03A3 3 0 0 0 27 4h-.2zm.2 2a1 1 0 0 1 .68 1.74l-.4.36.09.54a43.3 43.3 0 0 1 0 14.72l-.1.54.4.36a1 1 0 1 1-1.52 1.27l-.37-.6-.68.15a45.29 45.29 0 0 1-18.2 0l-.68-.14-.37.59a1 1 0 1 1-1.52-1.27l.4-.36-.1-.54a43.25 43.25 0 0 1 0-14.72l.1-.54-.4-.36a1 1 0 1 1 1.52-1.27l.37.6.68-.15a45.29 45.29 0 0 1 18.2 0l.68.14.37-.59A1 1 0 0 1 27 6z"></path>
                    </svg>
                    여분의 베개와 담요
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M16 2a5 5 0 0 1 1.66 9.72 1 1 0 0 0-.65.81l-.01.13v.81l13.23 9.05a3 3 0 0 1 1.3 2.28v.2a3 3 0 0 1-3 3H3.47a3 3 0 0 1-1.69-5.48L15 13.47v-.81a3 3 0 0 1 1.82-2.76l.17-.07a3 3 0 1 0-3.99-3V7h-2a5 5 0 0 1 5-5zm0 13.21L2.9 24.17A1 1 0 0 0 3.46 26h25.07a1 1 0 0 0 .57-1.82z"></path>
                    </svg>
                    옷걸이
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M12 28a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-6-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM16.03 3h.3a12.5 12.5 0 0 1 11.82 9.48l.07.3 1.73 7.79.03.14A2 2 0 0 1 28.15 23H2.1a2 2 0 0 1-1.85-1.84v-7.38a5 5 0 0 1 4.77-4.77L5.25 9h9V5h-14V3zm11.53 16H2.25v2H28zM16.24 5v6H5.07a3 3 0 0 0-2.82 2.82V17H27.1l-.84-3.78-.07-.28a10.5 10.5 0 0 0-9.6-7.92L16.32 5z"></path>
                    </svg>
                    다리미
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M1 2V0h30v2h-2v18a2 2 0 0 1-1.85 2H17v2.17a3 3 0 1 1-2 0V22H5a2 2 0 0 1-2-1.85V2zm15 24a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM27 2H5v18h22z"></path>
                    </svg>
                    모기장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M1 2V0h30v2h-2v18a2 2 0 0 1-1.85 2H17v2.17a3 3 0 1 1-2 0V22H5a2 2 0 0 1-2-1.85V2zm15 24a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM27 2H5v18h22z"></path>
                    </svg>
                    암막커튼
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M25 2a5 5 0 0 1 5 4.78V25a5 5 0 0 1-4.78 5H7a5 5 0 0 1-5-4.78V7a5 5 0 0 1 4.78-5H7zm0 2H7a3 3 0 0 0-3 2.82V11h2V6h20v20H6v-5H4v4a3 3 0 0 0 2.82 3H25a3 3 0 0 0 3-2.82V7a3 3 0 0 0-2.82-3zm-1 4H8v16h16zm-8 3a5 5 0 1 1 0 10 5 5 0 0 1 0-10zm0 2a3 3 0 1 0 0 6 3 3 0 0 0 0-6zM6 13H4v6h2z"></path>
                    </svg>
                    금고
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M26.29 2a3 3 0 0 1 2.96 2.58c.5 3.56.75 7.37.75 11.42s-.25 7.86-.75 11.42a3 3 0 0 1-2.79 2.57l-.17.01H5.7a3 3 0 0 1-2.96-2.58C2.25 23.86 2 20.05 2 16s.25-7.86.75-11.42a3 3 0 0 1 2.79-2.57L5.7 2zm0 2H5.72a1 1 0 0 0-1 .86A80.6 80.6 0 0 0 4 16c0 3.96.24 7.67.73 11.14a1 1 0 0 0 .87.85l.11.01h20.57a1 1 0 0 0 1-.86c.48-3.47.72-7.18.72-11.14 0-3.96-.24-7.67-.73-11.14A1 1 0 0 0 26.3 4zM16 7a9 9 0 1 1 0 18 9 9 0 0 1 0-18zm-5.84 7.5c-.34 0-.68.02-1.02.07a7 7 0 0 0 13.1 4.58 9.09 9.09 0 0 1-6.9-2.37l-.23-.23a6.97 6.97 0 0 0-4.95-2.05zM16 9a7 7 0 0 0-6.07 3.5h.23c2.26 0 4.44.84 6.12 2.4l.24.24a6.98 6.98 0 0 0 6.4 1.9A7 7 0 0 0 16 9zM7 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
                    </svg>
                    세탁기
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_bedAndLaundry"
               class="screens-room-roomEnroll__facility"
               value="0">

        <div>엔터테인먼트</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M26 0a2 2 0 0 1 2 1.85V22.88l1.97 7.88a1 1 0 0 1-.86 1.23L29 32H3a1 1 0 0 1-1-1.13l.03-.11L4 22.88V2a2 2 0 0 1 1.85-2H6zm.22 24H13.24a3 3 0 0 1-1.24.83V28h-2v-3.17A3 3 0 0 1 8.77 24H5.78l-1.5 6h23.44zM18 26a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm5 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-12-5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM26 2H6v20h2a3 3 0 0 1 6 0h12zm-5 2a3 3 0 0 1 3 2.82V15a3 3 0 0 1-2.82 3H11a3 3 0 0 1-3-2.82V7a3 3 0 0 1 2.82-3H11zm0 2H11a1 1 0 0 0-1 .88V15a1 1 0 0 0 .88 1H21a1 1 0 0 0 1-.88V7a1 1 0 0 0-.88-1z"></path>
                    </svg>
                    오락실 게임
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M28 5a3 3 0 0 1 3 2.82V24a3 3 0 0 1-2.82 3h-4.46l1.23 3.68-1.9.64L21.61 27H4a3 3 0 0 1-3-2.82V8a3 3 0 0 1 2.82-3H28zm0 18a1 1 0 0 0-.12 2h.24a1 1 0 0 0-.12-2zM4 23a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM25.17 7H19v1.18a3 3 0 0 1-6 0V7H6.83A3 3 0 0 1 3 10.83v10.34A3 3 0 0 1 6.83 25H13v-1a3 3 0 0 1 6-.18V25h1.95l-3.22-9.64 1.9-.63L23.05 25h2.12a2.99 2.99 0 0 1-.17-.82V24a3 3 0 0 1 4-2.83V10.83A3 3 0 0 1 25.17 7zM16 23a1 1 0 0 0-1 .88V25h2v-1a1 1 0 0 0-1-1zm2-11a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm10-5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM4 7a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm13 0h-2v1.12a1 1 0 0 0 2 0V7z"></path>
                    </svg>
                    야구 연습장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M1.67 2.68A2 2 0 0 1 4.1.72l.14.04L16.01 4.3 27.78.91a2 2 0 0 1 2.53 1.63l.02.14v23.25a2 2 0 0 1-1.27 1.85l-.15.06-12.62 3.78a1 1 0 0 1-.46.03l-.12-.03L3.1 27.84a2 2 0 0 1-1.42-1.75v-.17zm2 0v23.24L16 29.62l12.33-3.7V2.82L16.28 6.3a1 1 0 0 1-.46.03l-.1-.03zm21.66 17.48v2.08L16 25.04v-2.08zm0-6v2.08L16 19.04v-2.08zm0-6v2.08L16 13.04v-2.08z"></path>
                    </svg>
                    도서 및 읽을거리
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M10.5 1c2.2 0 4.15 1.98 3.93 4.41l-.02.2L14 8.17c-.29 1.71.08 3.6 1.12 5.64.26.47.5.93.7 1.39a8 8 0 1 1-1.18 12.74l-.3.65-.44.87a1 1 0 0 1-.77.54L13 30H8a1 1 0 0 1-.83-.44l-.06-.11-.43-.87C4.9 24.88 4 22.04 4 20c0-1.85.6-3.84 1.77-5.97 1.07-2.03 1.5-3.88 1.29-5.57L7 8.16 6.58 5.6A4.06 4.06 0 0 1 10.5 1zM20 16c-1.26 0-2.46.39-3.46 1.1.3 1.02.46 1.99.46 2.9 0 1.53-.5 3.5-1.5 5.96A6 6 0 1 0 20 16zm-7-2H8c-.14.33-.3.65-.47.98A10.62 10.62 0 0 0 6 20c0 1.15.4 2.74 1.18 4.75l.15.38.3.7c.19.46.4.93.63 1.41l.36.76h3.76l.31-.66.32-.68.15-.33.21-.5.3-.7a16.59 16.59 0 0 0 1.31-4.7l.02-.23V20c0-1.48-.54-3.23-1.66-5.27L13 14zm7 7a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm3-2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-3-1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-8.08-8H9.08c-.05.66-.17 1.32-.35 2h3.54c-.18-.68-.3-1.34-.35-2zM10.5 3C9.47 3 8.48 4 8.55 5.14l.01.15L9.01 8H12l.02-.16.42-2.52A2.05 2.05 0 0 0 10.5 3z"></path>
                    </svg>
                    볼링장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M10 5a2 2 0 0 1 2 1.85V15h8V7a2 2 0 0 1 1.85-2H24a2 2 0 0 1 2 1.85V9h2a2 2 0 0 1 2 1.85V15h2v2h-2v4a2 2 0 0 1-1.85 2H26v2a2 2 0 0 1-1.85 2H22a2 2 0 0 1-2-1.85V17h-8v8a2 2 0 0 1-1.85 2H8a2 2 0 0 1-2-1.85V23H4a2 2 0 0 1-2-1.85V17H0v-2h2v-4a2 2 0 0 1 1.85-2H6V7a2 2 0 0 1 1.85-2H8zm14 2h-2v18h2zM10 7H8v18h2zm18 4h-2v10h2zM6 11H4v10h2z"></path>
                    </svg>
                    운동 기구
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M30 2v2h-8a5 5 0 0 0-5 4.78V14h9a4 4 0 0 1 4 3.8V26a4 4 0 0 1-3.8 4H6a4 4 0 0 1-4-3.8V18a4 4 0 0 1 3.8-4H15V9a7 7 0 0 1 6.76-7H30zm-4 14H6a2 2 0 0 0-2 1.85V26a2 2 0 0 0 1.85 2H26a2 2 0 0 0 2-1.85V18a2 2 0 0 0-1.85-2H26zm-15 3v2h2v2h-2v2H9v-2H7v-2h2v-2h2zm13 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
                    </svg>
                    게임기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="m28.17 2.13.04.14L29.3 7 10.59 12H30v17a2 2 0 0 1-1.85 2H4a2 2 0 0 1-2-1.85V13.13L1 9.39A2 2 0 0 1 2.28 7l.14-.04L16.64 3.2l.02-.04.03.02L25.8.78a2 2 0 0 1 2.37 1.35zM28 19H4v10h24V19zm-16.42-5H4v3h4.58l3-3zM28 14h-3.59l-3 3H28v-3zm-6.42 0h-7.17l-3 3h7.17l3-3zM7.1 7.78l-4.17 1.1.78 2.9 7.04-1.9-3.65-2.1zm9.3-2.45L9.86 7.06l3.63 2.1 6.53-1.75-3.6-2.08zm9.86-2.6-7.1 1.87 3.58 2.08 4.18-1.12-.66-2.83z"></path>
                    </svg>
                    영화관
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M1 8a7 7 0 0 1 6.76-7H10a7 7 0 0 1 6.98 6.52l.02.24v.42A3 3 0 0 0 19.83 11H23a8 8 0 0 1 8 7.75V27a1 1 0 0 1-.88 1H29v3h-2v-3H5v3H3v-3H2a1 1 0 0 1-1-.88V8zm2 18h26v-6h-2v4h-2v-4h-2v4h-2v-4h-2v4h-2v-4h-2v4h-2v-4h-2v4H9v-4H7v4H5v-4H3v6zm7-23H8a5 5 0 0 0-5 4.78V18h25.91l-.01-.1a6 6 0 0 0-5.43-4.88l-.25-.02H20a5 5 0 0 1-5-4.77v-.42A5 5 0 0 0 10 3z"></path>
                    </svg>
                    피아노
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M27 23a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM18 1a11 11 0 0 1 0 22 9.08 9.08 0 0 1-1.51-.12l-.63-.12a7 7 0 0 0-5.94 1.75l-.2.2-4.01 4a1 1 0 0 1-1.32.08l-.1-.08-3-3a1 1 0 0 1-.08-1.32l.08-.1 3.94-3.93a7 7 0 0 0 1.98-5.9l-.09-.61A13.21 13.21 0 0 1 7 12 11 11 0 0 1 18 1zm-1.59 19.82-7.32-7.31.1.62a9 9 0 0 1-2.33 7.42l-.21.22L3.4 25 5 26.59l3.3-3.3a9 9 0 0 1 7.65-2.54l.3.04.16.04zM18 3a9 9 0 0 0-8.9 7.68L19.32 20.9A9 9 0 0 0 18 3z"></path>
                    </svg>
                    탁구대
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M28 5a3 3 0 0 1 3 2.82V24a3 3 0 0 1-2.82 3h-4.46l1.23 3.68-1.9.64L21.61 27H4a3 3 0 0 1-3-2.82V8a3 3 0 0 1 2.82-3H28zm0 18a1 1 0 0 0-.12 2h.24a1 1 0 0 0-.12-2zM4 23a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM25.17 7H19v1.18a3 3 0 0 1-6 0V7H6.83A3 3 0 0 1 3 10.83v10.34A3 3 0 0 1 6.83 25H13v-1a3 3 0 0 1 6-.18V25h1.95l-3.22-9.64 1.9-.63L23.05 25h2.12a2.99 2.99 0 0 1-.17-.82V24a3 3 0 0 1 4-2.83V10.83A3 3 0 0 1 25.17 7zM16 23a1 1 0 0 0-1 .88V25h2v-1a1 1 0 0 0-1-1zm2-11a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm10-5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM4 7a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm13 0h-2v1.12a1 1 0 0 0 2 0V7z"></path>
                    </svg>
                    당구대
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M24 1a5 5 0 0 1 5 4.78V26a5 5 0 0 1-4.78 5H8a5 5 0 0 1-5-4.78V6a5 5 0 0 1 4.78-5H8zm0 2H8a3 3 0 0 0-3 2.82V26a3 3 0 0 0 2.82 3H24a3 3 0 0 0 3-2.82V6a3 3 0 0 0-2.82-3zm-8 10a7 7 0 1 1 0 14 7 7 0 0 1 0-14zm0 2a5 5 0 1 0 0 10 5 5 0 0 0 0-10zm0 2a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm0-14a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path>
                    </svg>
                    스피커
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M9 29v-2h2v-2H6a5 5 0 0 1-5-4.78V8a5 5 0 0 1 4.78-5H26a5 5 0 0 1 5 4.78V20a5 5 0 0 1-4.78 5H21v2h2v2zm10-4h-6v2h6zm7-20H6a3 3 0 0 0-3 2.82V20a3 3 0 0 0 2.82 3H26a3 3 0 0 0 3-2.82V8a3 3 0 0 0-2.82-3z"></path>
                    </svg>
                    Tv
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_entertain"
               class="screens-room-roomEnroll__facility"
               value="0">

        <div>숙소 안전</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M25 2a5 5 0 0 1 5 4.78V25a5 5 0 0 1-4.78 5H7a5 5 0 0 1-5-4.78V7a5 5 0 0 1 4.78-5H7zm0 2H7a3 3 0 0 0-3 2.82V25a3 3 0 0 0 2.82 3H25a3 3 0 0 0 3-2.82V7a3 3 0 0 0-2.82-3zM11.1 17a5 5 0 0 0 3.9 3.9v2.03A7 7 0 0 1 9.07 17zm9.8 0h2.03A7 7 0 0 1 17 22.93V20.9a5 5 0 0 0 3.9-3.9zM16 13a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm1-5.93A7 7 0 0 1 22.93 15H20.9a5 5 0 0 0-3.9-3.9zm-2 0v2.03a5 5 0 0 0-3.9 3.9H9.07A7 7 0 0 1 15 9.07zM23 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
                    </svg>
                    일산화탄소 경보기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M7 28H5V15a11 11 0 0 1 8.06-10.6 3 3 0 0 1 4.63-1.88L20.35.24l1.3 1.52L19.04 4H23v2h-4.17A3 3 0 0 1 17 7.83v.24a7 7 0 0 1 5.98 6.45l.02.24V30a2 2 0 0 1-1.85 2H11a2 2 0 0 1-2-1.85V24H7zm9-18a5 5 0 0 0-4.98 4.57l-.02.22V30h10V14.82A5 5 0 0 0 16 10zm-2.65-3.6A9 9 0 0 0 7 14.73V22h2v-7.26a7 7 0 0 1 6-6.67v-.24a3.01 3.01 0 0 1-1.65-1.43zM16 4a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path>
                    </svg>
                    소화기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M26 3a5 5 0 0 1 5 4.78V24a5 5 0 0 1-4.78 5H6a5 5 0 0 1-5-4.78V8a5 5 0 0 1 4.78-5H6zm0 2H6a3 3 0 0 0-3 2.82V24a3 3 0 0 0 2.82 3H26a3 3 0 0 0 3-2.82V8a3 3 0 0 0-2.82-3zm-7 4v4h4v6h-4v4h-6v-4H9v-6h4V9zm-2 2h-2v4h-4v2h4v4h2v-4h4v-2h-4z"></path>
                    </svg>
                    구급상자
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M16 1a15 15 0 1 1 0 30 15 15 0 0 1 0-30zm0 2a13 13 0 1 0 0 26 13 13 0 0 0 0-26zm-4.9 14a5 5 0 0 0 3.9 3.9v2.03A7 7 0 0 1 9.07 17zm9.8 0h2.03A7 7 0 0 1 17 22.93V20.9a5 5 0 0 0 3.9-3.9zM16 13a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm1-5.93A7 7 0 0 1 22.93 15H20.9a5 5 0 0 0-3.9-3.9zm-2 0v2.03a5 5 0 0 0-3.9 3.9H9.07A7 7 0 0 1 15 9.07zM23 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
                    </svg>
                    화재 경보기
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_safety"
               class="screens-room-roomEnroll__facility"
               value="0">

        <div>냉난방</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M17 1v4.03l4.03-2.32 1 1.73L17 7.34v6.93l6-3.47V5h2v4.65l3.49-2.02 1 1.74L26 11.38l4.03 2.33-1 1.73-5.03-2.9L18 16l6 3.46 5.03-2.9 1 1.73L26 20.62l3.49 2.01-1 1.74L25 22.35V27h-2v-5.8l-6-3.47v6.93l5.03 2.9-1 1.73L17 26.97V31h-2v-4.03l-4.03 2.32-1-1.73 5.03-2.9v-6.93L9 21.2V27H7v-4.65l-3.49 2.02-1-1.74L6 20.62l-4.03-2.33 1-1.73L8 19.46 14 16l-6-3.46-5.03 2.9-1-1.73L6 11.38 2.51 9.37l1-1.74L7 9.65V5h2v5.8l6 3.47V7.34l-5.03-2.9 1-1.73L15 5.03V1z"></path>
                    </svg>
                    에어컨
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M16 2a10 10 0 0 1 1 19.95V28h6v2H9v-2h6v-6.05A10 10 0 0 1 16 2zm1.44 12.63a2.98 2.98 0 0 1-1.22.36L16 15v.01a2.51 2.51 0 0 0-2.5 2.52c0 1.17.78 2.16 1.85 2.44a7.99 7.99 0 0 0 6.96-3.05 4.61 4.61 0 0 1-4.87-2.29zM10.52 10a2.52 2.52 0 0 0-2.5 2.16l-.02.1a8 8 0 0 0 3.66 6.46 4.53 4.53 0 0 1-.16-1.19c0-1.59.82-2.99 2.05-3.8a3 3 0 0 1-.46-1l-.05-.24-.01-.12-.03-.3A2.52 2.52 0 0 0 10.52 10zm10.95 5a2.52 2.52 0 0 0 2.47-1.98 8 8 0 0 0-4.24-8.11c.2.5.3 1.05.3 1.62a4.53 4.53 0 0 1-1.7 3.54 3 3 0 0 1 .6 2.68v-.07A2.56 2.56 0 0 0 21.47 15zM16 11a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-.32-7a8 8 0 0 0-6.77 4.3l.16-.07A4.54 4.54 0 0 1 10.52 8c1.43 0 2.72.67 3.55 1.7A2.98 2.98 0 0 1 16 9a2.52 2.52 0 0 0 2-2.48 2.52 2.52 0 0 0-2.16-2.5l-.16-.01z"></path>
                    </svg>
                    선풍기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M16 0a5 5 0 0 1 5 4.78v12.98l.26.21a7.98 7.98 0 0 1 2.72 5.43l.02.3v.3a8 8 0 1 1-13.25-6.04l.25-.2V5A5 5 0 0 1 15.56.02l.22-.01zm0 2a3 3 0 0 0-3 2.82V18.78l-.43.3a6 6 0 1 0 7.06.15l-.2-.16-.43-.3V11h-4V9h4V7h-4V5h4a3 3 0 0 0-3-3zm1 11v7.13A4 4 0 0 1 16 28a4 4 0 0 1-1-7.87V13zm-1 9a2 2 0 1 0 0 4 2 2 0 0 0 0-4z"></path>
                    </svg>
                    난방
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M31 6v2h-1v23h-6V13H8v18H2V8H1V6zm-15.37 9 .96.7c3.32 2.42 5.14 5.06 5.38 7.93l.02.28v.21l.01.14c0 3.18-2.7 5.74-6 5.74a5.9 5.9 0 0 1-5.99-5.39v-.21l-.01-.15a9.3 9.3 0 0 1 1.64-4.99l.22-.34.68-.98 1.24.79zM28 8H4v21h2V13a2 2 0 0 1 1.7-1.98l.15-.01L8 11h16a2 2 0 0 1 2 1.85V29h2zM16 25.36l-.1.09c-.61.65-.9 1.23-.9 1.72 0 .42.41.83 1 .83s1-.4 1-.83c0-.45-.24-.97-.76-1.56l-.15-.16zm.35-7.32-1.77 3.56-1.46-.93-.15.27a7.28 7.28 0 0 0-.94 2.75l-.02.29-.01.26v.12c.03.92.4 1.76 1.03 2.4.14-1.14.86-2.24 2.1-3.33l.23-.2.64-.53.64.53c1.38 1.16 2.19 2.32 2.33 3.53A3.6 3.6 0 0 0 20 24.49l.01-.22V24c-.1-1.86-1.12-3.7-3.13-5.5l-.27-.24zM31 2v2H1V2z"></path>
                    </svg>
                    벽난로
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_heatAndCold"
               class="screens-room-roomEnroll__facility"
               value="0">

        <div>인터넷 및 업무 공간</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M26 2a1 1 0 0 1 .92.61l.04.12 2 7a1 1 0 0 1-.85 1.26L28 11h-3v5h6v2h-2v13h-2v-2.54a3.98 3.98 0 0 1-1.73.53L25 29H7a3.98 3.98 0 0 1-2-.54V31H3V18H1v-2h5v-4a1 1 0 0 1 .88-1h.36L6.09 8.4l1.82-.8L9.43 11H12a1 1 0 0 1 1 .88V16h10v-5h-3a1 1 0 0 1-.99-1.16l.03-.11 2-7a1 1 0 0 1 .84-.72L22 2h4zm1 16H5v7a2 2 0 0 0 1.7 1.98l.15.01L7 27h18a2 2 0 0 0 2-1.85V18zm-16-5H8v3h3v-3zm14.24-9h-2.49l-1.43 5h5.35l-1.43-5z"></path>
                    </svg>
                    업무 전용 공간(테이블, 의자)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M21 1a5 5 0 0 1 5 4.78V26a5 5 0 0 1-4.78 5H11a5 5 0 0 1-5-4.78V6a5 5 0 0 1 4.78-5H11zm0 2H11a3 3 0 0 0-3 2.82V26a3 3 0 0 0 2.82 3H21a3 3 0 0 0 3-2.82V6a3 3 0 0 0-2.82-3zM10 25a2 2 0 0 1 2 1.85V27h-2zm0-4a6 6 0 0 1 6 5.78V27h-2a4 4 0 0 0-3.8-4H10zm0-4a10 10 0 0 1 10 9.72V27h-2a8 8 0 0 0-7.75-8H10z"></path>
                    </svg>
                    포켓 와이파이
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M16 20.33a3.67 3.67 0 1 1 0 7.34 3.67 3.67 0 0 1 0-7.34zm0 2a1.67 1.67 0 1 0 0 3.34 1.67 1.67 0 0 0 0-3.34zM16 15a9 9 0 0 1 8.04 4.96l-1.51 1.51a7 7 0 0 0-13.06 0l-1.51-1.51A9 9 0 0 1 16 15zm0-5.33c4.98 0 9.37 2.54 11.94 6.4l-1.45 1.44a12.33 12.33 0 0 0-20.98 0l-1.45-1.45A14.32 14.32 0 0 1 16 9.66zm0-5.34c6.45 0 12.18 3.1 15.76 7.9l-1.43 1.44a17.64 17.64 0 0 0-28.66 0L.24 12.24c3.58-4.8 9.3-7.9 15.76-7.9z"></path>
                    </svg>
                    무선 인터넷
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_internetAndWorkSpace"
               class="screens-room-roomEnroll__facility"
               value="0">

        <div>주방 및 식당</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M13 2h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19C11.6 10 11.2 10.9 11.06 12H9.04c.1-1.07.38-1.97.9-3H6a10 10 0 0 0 20 .28V9h-3.77a7.44 7.44 0 0 0-1.17 3h-2.02c.15-1.61.71-2.84 1.91-4.73l.57-.88c1.11-1.79 1.47-2.78 1.47-4.4h2c0 1.93-.4 3.17-1.5 5L28 7v2c0 .68-.06 1.35-.17 2H30v2h-2.68a12.04 12.04 0 0 1-5.9 6.7l4.5 9.89-1.83.82-2-4.41H17v4h-2v-4H9.92L7.9 30.41l-1.82-.82 4.49-9.88A12.04 12.04 0 0 1 4.68 13H2v-2h2.17A12.06 12.06 0 0 1 4 9.3V7h7.13l.39-.6c1.11-1.8 1.47-2.8 1.47-4.4zm-.57 18.46L10.83 24H15v-3.04a11.95 11.95 0 0 1-2.57-.5zm4.57.5V24h4.17l-1.6-3.54c-.69.21-1.4.37-2.13.45zM18 2h2c0 2.06-.48 3.35-1.77 5.42l-.75 1.19C16.6 10 16.2 10.9 16.06 12h-2.02c.15-1.62.71-2.84 1.91-4.74l.57-.88C17.63 4.6 17.99 3.61 17.99 2z"></path>
                    </svg>
                    바베큐 도구
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M4 25c.51 0 .94.5 1 1v2h22v-2c0-.51.5-1 1-1h3v2h-2v2c0 .51-.5 1-1 1H4c-.5 0-1-.5-1-1v-2H1v-2zm16-10a5.7 5.7 0 0 1 5.67 5.2l.18 2.6a3 3 0 0 1-2.79 3.2H9.14a3 3 0 0 1-3-3l.17-2.57A5.93 5.93 0 0 1 12 15zm-5 2h-2v3h-2v-2.83a3.83 3.83 0 0 0-2.67 3.19A21.5 21.5 0 0 0 8.14 23c0 .51.36.94.86 1h14c.51-.04.83-.45.86-.95a343.57 343.57 0 0 0-.17-2.48 3.83 3.83 0 0 0-2.69-3.4V20h-2v-3h-2v3h-2zm9-15h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V13h-2c0-2.16.52-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15zm-5 0h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V13h-2c0-2.16.52-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15zm-5 0h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V13h-2c0-2.16.51-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15z"></path>
                    </svg>
                    제빵기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M23 1a1 1 0 0 1 1 .88V6l-.02.2-2.9 14.53a5 5 0 0 1 2.31 3.4l.04.25.56 4.5a1 1 0 0 1-.87 1.11L23 30H9a1 1 0 0 1-1-1v-.12l.57-4.5a5 5 0 0 1 2.36-3.65L8.18 7H7a1 1 0 0 0-1 .88V15H4V8a3 3 0 0 1 2.82-3H8V2a1 1 0 0 1 .88-1H23zm-9.5 21a3 3 0 0 0-2.92 2.45l-.03.18-.42 3.37h11.74l-.42-3.37a3 3 0 0 0-2.62-2.6L18.5 22h-5zm2.5 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm5.78-17H10.22l2.6 13H15v-9h2v9h2.18l2.6-13zM22 3H10v2h12V3z"></path>
                    </svg>
                    믹서기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M25 2a1 1 0 0 1 .94.65l.03.1 1 4A1 1 0 0 1 26.11 8L26 8h-9v2h-2V8H5v20h3a5 5 0 0 1-.72-4.66l.1-.26 2.52-6.04-1.8-3.6a1 1 0 0 1 .78-1.43L9 12h14a1 1 0 0 1 .94 1.34l-.05.1L22.62 16H24a5 5 0 0 1 5 4.78V25h-2v-4a3 3 0 0 0-2.82-3H22.5l2.12 5.08A5 5 0 0 1 24 28h3v2H4a1 1 0 0 1-1-.88V3a1 1 0 0 1 .88-1H4zM12.65 22a6.64 6.64 0 0 0-2.91.63l-.5 1.22a3 3 0 0 0-.2.68l-.03.23L9 25a3 3 0 0 0 2.82 3h8.19l.23-.01a3 3 0 0 0 2.6-2.02c-1.7-.12-2.93-.67-4.84-1.9l-.37-.23c-2.14-1.4-3.18-1.84-4.98-1.84zm7.68-4h-8.66l-.92 2.19a9.06 9.06 0 0 1 1.9-.19c2.19 0 3.51.52 5.75 1.95l.38.25c1.74 1.13 2.74 1.62 4.03 1.76l-.04-.11zm1.05-4H10.62l1 2h8.76zm2.84-10H5v2h19.72z"></path>
                    </svg>
                    커피
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M25 2a1 1 0 0 1 .94.65l.03.1 1 4A1 1 0 0 1 26.11 8L26 8h-9v2h-2V8H5v20h3a5 5 0 0 1-.72-4.66l.1-.26 2.52-6.04-1.8-3.6a1 1 0 0 1 .78-1.43L9 12h14a1 1 0 0 1 .94 1.34l-.05.1L22.62 16H24a5 5 0 0 1 5 4.78V25h-2v-4a3 3 0 0 0-2.82-3H22.5l2.12 5.08A5 5 0 0 1 24 28h3v2H4a1 1 0 0 1-1-.88V3a1 1 0 0 1 .88-1H4zM12.65 22a6.64 6.64 0 0 0-2.91.63l-.5 1.22a3 3 0 0 0-.2.68l-.03.23L9 25a3 3 0 0 0 2.82 3h8.19l.23-.01a3 3 0 0 0 2.6-2.02c-1.7-.12-2.93-.67-4.84-1.9l-.37-.23c-2.14-1.4-3.18-1.84-4.98-1.84zm7.68-4h-8.66l-.92 2.19a9.06 9.06 0 0 1 1.9-.19c2.19 0 3.51.52 5.75 1.95l.38.25c1.74 1.13 2.74 1.62 4.03 1.76l-.04-.11zm1.05-4H10.62l1 2h8.76zm2.84-10H5v2h19.72z"></path>
                    </svg>
                    커피 메이커
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M26 1a5 5 0 0 1 5 5c0 6.39-1.6 13.19-4 14.7V31h-2V20.7c-2.36-1.48-3.94-8.07-4-14.36v-.56A5 5 0 0 1 26 1zm-9 0v18.12c2.32.55 4 3 4 5.88 0 3.27-2.18 6-5 6s-5-2.73-5-6c0-2.87 1.68-5.33 4-5.88V1zM2 1h1c4.47 0 6.93 6.37 7 18.5V21H4v10H2zm14 20c-1.6 0-3 1.75-3 4s1.4 4 3 4 3-1.75 3-4-1.4-4-3-4zM4 3.24V19h4l-.02-.96-.03-.95C7.67 9.16 6.24 4.62 4.22 3.36L4.1 3.3zm19 2.58v.49c.05 4.32 1.03 9.13 2 11.39V3.17a3 3 0 0 0-2 2.65zm4-2.65V17.7c.99-2.31 2-7.3 2-11.7a3 3 0 0 0-2-2.83z"></path>
                    </svg>
                    기본 조리도구(냄비, 후라이팬, 기름, 소금, 후추 등)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M31 9v21h-2v-7h-6v7h-2v-7a2 2 0 0 1 1.85-2H29V9h2zM3 9v12h6a2 2 0 0 1 2 1.85V30H9v-7H3v7H1V9h2zm14-2v2.08a6 6 0 0 1 5 5.7V15h5v2H17v13h-2V17H5v-2h5a6 6 0 0 1 5-5.92V7h2zm-1 4a4 4 0 0 0-4 3.8v.2h8a4 4 0 0 0-4-4z"></path>
                    </svg>
                    식탁
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M29 1v2a13 13 0 0 0-.3 26h.3v2a15 15 0 0 1-.31-30zM3 1h2v6h2V1h2v6h2V1h2v9a5 5 0 0 1-4 4.9V31H7V14.9a5.01 5.01 0 0 1-3.98-4.44L3 10.22V10zm26 6v2a7 7 0 0 0-.24 14H29v2a9 9 0 0 1-.27-18zM11 9H5v1.15a3 3 0 0 0 6 .03V10z"></path>
                    </svg>
                    식기류(그릇, 젓가락, 접시, 컵 등)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M28 2a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H4a2 2 0 0 1-2-1.85V4a2 2 0 0 1 1.85-2H4zm0 10H4v16h24zm-2 2v4a3 3 0 0 1-2 2.83V24h2v2h-6v-2h2v-3.17a3 3 0 0 1-2-2.65V14zm-14 0a6 6 0 1 1 0 12 6 6 0 0 1 0-12zm0 2a4 4 0 1 0 0 8 4 4 0 0 0 0-8zm12 0h-2v2a1 1 0 0 0 .77.97l.11.02.12.01a1 1 0 0 0 1-.88V18zm4-12H4v6h24zm-6 2v2H10V6zM7 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
                    </svg>
                    식기 세척기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M25 1a2 2 0 0 1 2 1.85V29a2 2 0 0 1-1.85 2H7a2 2 0 0 1-2-1.85V3a2 2 0 0 1 1.85-2H7zm0 10H7v18h18zm-15 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM25 3H7v6h18zM10 5a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
                    </svg>
                    냉동고
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M26 1a5 5 0 0 1 5 5c0 6.39-1.6 13.19-4 14.7V31h-2V20.7c-2.36-1.48-3.94-8.07-4-14.36v-.56A5 5 0 0 1 26 1zm-9 0v18.12c2.32.55 4 3 4 5.88 0 3.27-2.18 6-5 6s-5-2.73-5-6c0-2.87 1.68-5.33 4-5.88V1zM2 1h1c4.47 0 6.93 6.37 7 18.5V21H4v10H2zm14 20c-1.6 0-3 1.75-3 4s1.4 4 3 4 3-1.75 3-4-1.4-4-3-4zM4 3.24V19h4l-.02-.96-.03-.95C7.67 9.16 6.24 4.62 4.22 3.36L4.1 3.3zm19 2.58v.49c.05 4.32 1.03 9.13 2 11.39V3.17a3 3 0 0 0-2 2.65zm4-2.65V17.7c.99-2.31 2-7.3 2-11.7a3 3 0 0 0-2-2.83z"></path>
                    </svg>
                    주방
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M29 3a2 2 0 0 1 2 1.85V27a2 2 0 0 1-1.85 2H3a2 2 0 0 1-2-1.85V5a2 2 0 0 1 1.85-2H3zm0 2H3v22h26zm-6 2v18H5V7zm-2 2H7v14h3a4.97 4.97 0 0 1-1-2.72V17h10v3a4.98 4.98 0 0 1-1 3h3zm-4 10h-6v1a3 3 0 0 0 2.65 2.98l.17.01.18.01a3 3 0 0 0 3-2.82V20zm9-8a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-4a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
                    </svg>
                    전자레인지
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M28 2a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H4a2 2 0 0 1-2-1.85V4a2 2 0 0 1 1.85-2H4zm0 10H4v16h24zm-2 2v12H6V14zm-2 2H8v8h16zm4-12H4v6h24zm-3 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-6 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-6 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM7 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
                    </svg>
                    오븐
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M25 1a2 2 0 0 1 2 1.85V29a2 2 0 0 1-1.85 2H7a2 2 0 0 1-2-1.85V3a2 2 0 0 1 1.85-2H7zm0 10H7v18h18zm-15 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM25 3H7v6h18zM10 5a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
                    </svg>
                    냉장고
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M21 3a9 9 0 0 1 9 8.73V16h1v2h-1v9a2 2 0 0 1-1.85 2H4a2 2 0 0 1-2-1.85V18H1v-2h1v-4a9 9 0 0 1 8.73-9H11zm7 11H4v13h24zm-8 2v2h-8v-2zM9 16a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm14 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM21 5H11a7 7 0 0 0-7 6.76V12h7V8h10v4h7a7 7 0 0 0-6.76-7zm-2 5h-6v2h6z"></path>
                    </svg>
                    전기 밥솥
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M27 0a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H5a2 2 0 0 1-2-1.85V2a2 2 0 0 1 1.85-2H5zm0 2H5v26h22zm-3 22a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5.33 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5.34 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM8 24a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm13-10a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm-10 0a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm10 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-10 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM21 4a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM11 4a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm10 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM11 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4z"></path>
                    </svg>
                    가스레인지 / 인덕션
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="m9.24 3-.2.4a20.37 20.37 0 0 0-1.7 5.02v.03A9 9 0 0 1 10.16 8c2.26 0 4.44.84 6.12 2.4l.24.24a6.98 6.98 0 0 0 4.95 2.05 6.99 6.99 0 0 0 3.53-.95v-.23a19.57 19.57 0 0 0-2.04-8.1l-.2-.41H9.24zm.92 7a7 7 0 0 0-3.11.73C7 11.15 7 11.57 7 12a9 9 0 0 0 9 9c4.06 0 7.7-3.14 8.72-6.92a9 9 0 0 1-3.25.6 8.98 8.98 0 0 1-6.13-2.4l-.23-.23A6.97 6.97 0 0 0 10.16 10zm13.8-9 .29.52A21.78 21.78 0 0 1 27 12c0 5.4-4.53 10.4-10 10.95V29h6v2H9v-2h6v-6.04A11 11 0 0 1 5 12c0-3.6.92-7.09 2.75-10.48L8.04 1h15.92z"></path>
                    </svg>
                    와인잔
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_kitchen"
               class="screens-room-roomEnroll__facility"
               value="0">

        <div>야외</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M16 1a5 5 0 0 1 5 5 5 5 0 0 1 0 10 5 5 0 0 1-4 4.9v4.29A9.04 9.04 0 0 1 23.95 22a8.94 8.94 0 0 1 3.74.81l.31.15v2.33A6.96 6.96 0 0 0 23.95 24a6.88 6.88 0 0 0-6.93 5.87l-.02.15v.1a1 1 0 0 1-.88.87L16 31a1 1 0 0 1-.97-.77l-.02-.12A6.95 6.95 0 0 0 7.97 24 6.96 6.96 0 0 0 4 25.23v-2.31a9.16 9.16 0 0 1 11 2.3V20.9a5 5 0 0 1-4-4.68V16h-.22a5 5 0 0 1 0-10H11v-.22A5 5 0 0 1 16 1zm2.86 14.1a4.98 4.98 0 0 1-5.72 0l-.07.23a3 3 0 1 0 5.85 0zM11 8a3 3 0 1 0 .67 5.93l.23-.07A4.98 4.98 0 0 1 11 11c0-1.06.33-2.05.9-2.86l-.23-.07A3.01 3.01 0 0 0 11 8zm10 0c-.23 0-.45.03-.67.07l-.23.07c.57.8.9 1.8.9 2.86a4.98 4.98 0 0 1-.9 2.86l.23.07A3 3 0 1 0 21 8zm-5 0a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm0-5a3 3 0 0 0-2.93 3.67l.07.23a4.98 4.98 0 0 1 5.72 0l.07-.23A3 3 0 0 0 16 3z"></path>
                    </svg>
                    뒷마당
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M13 2h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19C11.6 10 11.2 10.9 11.06 12H9.04c.1-1.07.38-1.97.9-3H6a10 10 0 0 0 20 .28V9h-3.77a7.44 7.44 0 0 0-1.17 3h-2.02c.15-1.61.71-2.84 1.91-4.73l.57-.88c1.11-1.79 1.47-2.78 1.47-4.4h2c0 1.93-.4 3.17-1.5 5L28 7v2c0 .68-.06 1.35-.17 2H30v2h-2.68a12.04 12.04 0 0 1-5.9 6.7l4.5 9.89-1.83.82-2-4.41H17v4h-2v-4H9.92L7.9 30.41l-1.82-.82 4.49-9.88A12.04 12.04 0 0 1 4.68 13H2v-2h2.17A12.06 12.06 0 0 1 4 9.3V7h7.13l.39-.6c1.11-1.8 1.47-2.8 1.47-4.4zm-.57 18.46L10.83 24H15v-3.04a11.95 11.95 0 0 1-2.57-.5zm4.57.5V24h4.17l-1.6-3.54c-.69.21-1.4.37-2.13.45zM18 2h2c0 2.06-.48 3.35-1.77 5.42l-.75 1.19C16.6 10 16.2 10.9 16.06 12h-2.02c.15-1.62.71-2.84 1.91-4.74l.57-.88C17.63 4.6 17.99 3.61 17.99 2z"></path>
                    </svg>
                    바베큐 그릴
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M21.54.8a13.67 13.67 0 0 1 9.74 16.43l-.08.3-.26.97-12.35-3.3-3.86 14.13h-2.07l4-14.66-12.12-3.24.26-.97A13.67 13.67 0 0 1 21.54.8zM5.67 21a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM25.33 4.92l.05.17c.74 2.34.77 5.38 0 8.5l-.1.33-.24.93 4.45 1.2.03-.2c.68-4.21-1-8.36-4.2-10.93zm-3.46-1.75-2.75 10.1 3.99 1.06.25-.93c1.23-4.6.44-8.83-1.5-10.23zm-1.95-.45c-2.28.38-4.9 3.46-6.14 7.79l-.08.3-.25.93 3.73 1zm-3.67-.26-.22.04a11.68 11.68 0 0 0-8.8 7.03l-.13.31-.07.19 4.48 1.2.25-.94c.9-3.33 2.55-6.12 4.5-7.83z"></path>
                    </svg>
                    해수욕 필수품 (비치타월, 우산, 해변용 담요, 스노클링 장비 등)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M11 6v2H9.62l2 4h10.24L20.3 8H17V6h4a1 1 0 0 1 .88.53l.05.11 3.62 9.38a5 5 0 1 1-1.92.58l-.53-1.36-7.44 6.51a1 1 0 0 1-.54.24L15 22h-4.1A5 5 0 0 1 1 21a5 5 0 0 1 6.3-4.83l1.8-3.62a1 1 0 0 1 .36-.4L7.38 8H5V6zM6 18a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm20 0a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm-15.5-3.76-1.41 2.83A5 5 0 0 1 10.9 20h2.48zM21.48 14h-8.86l2.7 5.4z"></path>
                    </svg>
                    자전거
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M13 2h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19C11.6 10 11.2 10.9 11.06 12H9.04c.1-1.07.38-1.97.9-3H6a10 10 0 0 0 20 .28V9h-3.77a7.44 7.44 0 0 0-1.17 3h-2.02c.15-1.61.71-2.84 1.91-4.73l.57-.88c1.11-1.79 1.47-2.78 1.47-4.4h2c0 1.93-.4 3.17-1.5 5L28 7v2c0 .68-.06 1.35-.17 2H30v2h-2.68a12.04 12.04 0 0 1-5.9 6.7l4.5 9.89-1.83.82-2-4.41H17v4h-2v-4H9.92L7.9 30.41l-1.82-.82 4.49-9.88A12.04 12.04 0 0 1 4.68 13H2v-2h2.17A12.06 12.06 0 0 1 4 9.3V7h7.13l.39-.6c1.11-1.8 1.47-2.8 1.47-4.4zm-.57 18.46L10.83 24H15v-3.04a11.95 11.95 0 0 1-2.57-.5zm4.57.5V24h4.17l-1.6-3.54c-.69.21-1.4.37-2.13.45zM18 2h2c0 2.06-.48 3.35-1.77 5.42l-.75 1.19C16.6 10 16.2 10.9 16.06 12h-2.02c.15-1.62.71-2.84 1.91-4.74l.57-.88C17.63 4.6 17.99 3.61 17.99 2z"></path>
                    </svg>
                    화로
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M3 30H1V2h2v12h26V2h2v28h-2v-4.2l-.52.07a16.99 16.99 0 0 1-2.13.13c-1.8 0-3.55-.28-5.17-.81A16.81 16.81 0 0 1 16 26a16.5 16.5 0 0 1-13-6.24zm8.15-14H3l.14.3a14.4 14.4 0 0 0 14.99 7.55A16.08 16.08 0 0 1 11.15 16zM29 19.76a16.26 16.26 0 0 1-4.77 4.09 14.92 14.92 0 0 0 4.77-.09zM13.35 16a14.21 14.21 0 0 0 7.83 7.07A14.22 14.22 0 0 0 29 16.01V16z"></path>
                    </svg>
                    해먹
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M30.97 2.26a74.69 74.69 0 0 1-2.73 8.66c-1.63 4.26-3.45 7.41-5.85 10.06l1.46 1.46a3.48 3.48 0 0 1 3.95.46l2.16 2.14a3.48 3.48 0 0 1-4.77 5.06l-2.15-2.14a3.48 3.48 0 0 1-.6-4.1l-1.45-1.45c-4.67 4.4-11.37 7.38-18.83 8.58a1 1 0 0 1-1.13-1.21l.4-1.73C3.38 20.27 5.74 15.08 9.6 11L8.15 9.56A3.48 3.48 0 0 1 4.2 9.1L2.04 6.96A3.48 3.48 0 0 1 6.81 1.9l2.15 2.14a3.48 3.48 0 0 1 .6 4.1l1.46 1.47c4.52-4.06 11.16-7.02 18.78-8.59a1 1 0 0 1 1.17 1.24zm-6.51 22.2a1.48 1.48 0 0 0-.1 1.97l2.1 2.11a1.48 1.48 0 0 0 2.19-1.97l-2.1-2.11a1.48 1.48 0 0 0-2.1 0zM11 12.42c-3.46 3.68-5.67 8.4-7.48 15.5l-.2.83.17-.04c6.4-1.29 12.07-3.96 16.08-7.72L18 19.41l-1.3 1.3a3.83 3.83 0 0 1-5.25.15l-.16-.15a3.83 3.83 0 0 1-.15-5.26L12.58 14l-1.57-1.58zm2.99 3-1.3 1.29a1.83 1.83 0 0 0-.1 2.46l.1.12a1.83 1.83 0 0 0 2.47.12L16.6 18l-2.6-2.59zM28.6 3.3C22.8 4.7 16.9 7 12.4 11l8.5 8.5c3.71-4.08 5.7-9.3 7.24-14.57l.46-1.63zm-6.7 6.8a3.83 3.83 0 0 1 .15 5.26L20.9 16.5l-1.41-1.41.99-.99a1.83 1.83 0 0 0 .1-2.46l-.1-.12a1.83 1.83 0 0 0-2.47-.12l-1.1 1.1-1.42-1.41.99-.99a3.83 3.83 0 0 1 5.41 0zM3.46 3.46a1.48 1.48 0 0 0-.1 1.97l2.1 2.11a1.48 1.48 0 0 0 2.19-1.97l-2.1-2.11a1.48 1.48 0 0 0-2.1 0z"></path>
                    </svg>
                    카약
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M29 15v16h-2v-6h-6v6h-2v-6.15a2 2 0 0 1 1.84-1.84L21 23h6v-8zM5 15v8h6a2 2 0 0 1 2 1.85V31h-2v-6H5v6H3V15zM16 1a15 15 0 0 1 13.56 8.57 1 1 0 0 1-.8 1.42l-.1.01H17v8h8v2h-8v10h-2V21H7v-2h8v-8H3.35a1 1 0 0 1-.95-1.32l.04-.1A15 15 0 0 1 16 1zm0 2A13 13 0 0 0 5.4 8.47l-.2.28-.16.25h21.92l-.17-.25a13 13 0 0 0-10.1-5.73L16.34 3z"></path>
                    </svg>
                    야외 식사 공간
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M29 15v16h-2v-6h-6v6h-2v-6.15a2 2 0 0 1 1.84-1.84L21 23h6v-8zM5 15v8h6a2 2 0 0 1 2 1.85V31h-2v-6H5v6H3V15zM16 1a15 15 0 0 1 13.56 8.57 1 1 0 0 1-.8 1.42l-.1.01H17v8h8v2h-8v10h-2V21H7v-2h8v-8H3.35a1 1 0 0 1-.95-1.32l.04-.1A15 15 0 0 1 16 1zm0 2A13 13 0 0 0 5.4 8.47l-.2.28-.16.25h21.92l-.17-.25a13 13 0 0 0-10.1-5.73L16.34 3z"></path>
                    </svg>
                    야외 가구
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M13 2h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19C11.6 10 11.2 10.9 11.06 12H9.04c.1-1.07.38-1.97.9-3H6a10 10 0 0 0 20 .28V9h-3.77a7.44 7.44 0 0 0-1.17 3h-2.02c.15-1.61.71-2.84 1.91-4.73l.57-.88c1.11-1.79 1.47-2.78 1.47-4.4h2c0 1.93-.4 3.17-1.5 5L28 7v2c0 .68-.06 1.35-.17 2H30v2h-2.68a12.04 12.04 0 0 1-5.9 6.7l4.5 9.89-1.83.82-2-4.41H17v4h-2v-4H9.92L7.9 30.41l-1.82-.82 4.49-9.88A12.04 12.04 0 0 1 4.68 13H2v-2h2.17A12.06 12.06 0 0 1 4 9.3V7h7.13l.39-.6c1.11-1.8 1.47-2.8 1.47-4.4zm-.57 18.46L10.83 24H15v-3.04a11.95 11.95 0 0 1-2.57-.5zm4.57.5V24h4.17l-1.6-3.54c-.69.21-1.4.37-2.13.45zM18 2h2c0 2.06-.48 3.35-1.77 5.42l-.75 1.19C16.6 10 16.2 10.9 16.06 12h-2.02c.15-1.62.71-2.84 1.91-4.74l.57-.88C17.63 4.6 17.99 3.61 17.99 2z"></path>
                    </svg>
                    야외 주방
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M23 1a2 2 0 0 1 2 1.85V19h4v2h-2v8h2v2H3v-2h2v-8H3v-2h4V3a2 2 0 0 1 1.85-2H9zM9 21H7v8h2zm4 0h-2v8h2zm4 0h-2v8h2zm4 0h-2v8h2zm4 0h-2v8h2zm-10-8H9v6h6zm8 0h-6v6h6zM15 3H9v8h6zm8 0h-6v8h6z"></path>
                    </svg>
                    발코니
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M5 17a1 1 0 0 1-.93-1.36 13.28 13.28 0 0 1 15.3-8.33 4 4 0 1 1 7.03 3.8l-.13.2.21.24a13.81 13.81 0 0 1 2.45 4.09 1 1 0 0 1-.82 1.35L28 17H17v9h13v2h-4v3h-2v-3H9v3H7v-3H2v-2h3.59l-4.3-4.3 1.42-1.4L8.4 26H15v-9zm11.5-8a11.2 11.2 0 0 0-9.77 5.69l-.17.31h19.88l-.17-.32a11.2 11.2 0 0 0-9.12-5.66L16.81 9zM31 8v2h-3V8zm-8-1a2 2 0 0 0-1.67.9 13.1 13.1 0 0 1 3.45 2.01A2 2 0 0 0 23 7zm4.95-4.36 1.41 1.41-2.12 2.12-1.41-1.41zm-9.9 0 2.12 2.12-1.41 1.41-2.12-2.12zM24 1v3h-2V1z"></path>
                    </svg>
                    선베드
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_outdoor"
               class="screens-room-roomEnroll__facility"
               value="0">

        <div>주차장 및 기타 시설</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M23 1a2 2 0 0 1 2 1.85V19h4v2h-2v8h2v2H3v-2h2v-8H3v-2h4V3a2 2 0 0 1 1.85-2H9zM9 21H7v8h2zm4 0h-2v8h2zm4 0h-2v8h2zm4 0h-2v8h2zm4 0h-2v8h2zm-10-8H9v6h6zm8 0h-6v6h6zM15 3H9v8h6zm8 0h-6v8h6z"></path>
                    </svg>
                    엘리베이터
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M2 4h2v2h2V4h2v5a3 3 0 0 1-2 2.83V17a1 1 0 0 0 .88 1H10V5a3 3 0 0 1 3-3h12a3 3 0 0 1 3 3v23h2v2H2v-2h8v-8H7a3 3 0 0 1-3-2.82v-5.35a3 3 0 0 1-2-2.64V4zm23 0H12.88A1 1 0 0 0 12 5v23h14V5a1 1 0 0 0-1-1zm-4.43 13-1.8 3H21a1 1 0 0 1 .91 1.41l-.05.1-2.1 3.49h-2.33l1.8-3H17a1 1 0 0 1-.91-1.41l.05-.1 2.1-3.49h2.33zM23 6a1 1 0 0 1 1 1v6a1 1 0 0 1-1 1h-8a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h8zm-1 2h-6v4h6V8zM6 8H4v1a1 1 0 0 0 .77.97l.11.02L5 10a1 1 0 0 0 1-.88V8z"></path>
                    </svg>
                    전기차 충전 시설
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z"></path>
                    </svg>
                    건물 내 무료 주차
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z"></path>
                    </svg>
                    도로 주차(무료)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M10 5a2 2 0 0 1 2 1.85V15h8V7a2 2 0 0 1 1.85-2H24a2 2 0 0 1 2 1.85V9h2a2 2 0 0 1 2 1.85V15h2v2h-2v4a2 2 0 0 1-1.85 2H26v2a2 2 0 0 1-1.85 2H22a2 2 0 0 1-2-1.85V17h-8v8a2 2 0 0 1-1.85 2H8a2 2 0 0 1-2-1.85V23H4a2 2 0 0 1-2-1.85V17H0v-2h2v-4a2 2 0 0 1 1.85-2H6V7a2 2 0 0 1 1.85-2H8zm14 2h-2v18h2zM10 7H8v18h2zm18 4h-2v10h2zM6 11H4v10h2z"></path>
                    </svg>
                    헬스장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M9.5 2a4.5 4.5 0 0 1 3.53 7.3c.6.21 1.17.54 1.66.98l.19.19L17.4 13H31v2h-2v14a2 2 0 0 1-1.85 2H5a2 2 0 0 1-2-1.85V15H1v-2h2.1a5 5 0 0 1 2.96-3.6A4.5 4.5 0 0 1 9.5 2zm7.08 13H5v14h22V15h-7.59l3.3 3.3-1.42 1.4zM9.5 4a2.5 2.5 0 0 0-1 4.8V11H8a3 3 0 0 0-2.83 2h9.41l-1.12-1.12a3 3 0 0 0-1.92-.87l-.2-.01h-.84V8.8a2.5 2.5 0 0 0-1-4.8zm15.49-3a6.96 6.96 0 0 1-1.8 4.07l-.45.46A8.97 8.97 0 0 0 20.35 11h-2a10.97 10.97 0 0 1 3.2-7.12A4.96 4.96 0 0 0 22.97 1zm2 0h2a10.96 10.96 0 0 1-3.2 7.12A4.97 4.97 0 0 0 24.38 11h-2a6.97 6.97 0 0 1 1.8-4.06l.44-.47A8.96 8.96 0 0 0 26.99 1z"></path>
                    </svg>
                    온수 욕조
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z"></path>
                    </svg>
                    외부 유료 주차
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z"></path>
                    </svg>
                    건물 내 유료 주차
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M24 26c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 28c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 28c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 28c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 26c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 26c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 26zm0-5c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 23c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 23c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 23c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 21c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 21c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 21zM20 3a4 4 0 0 1 4 3.8V9h4v2h-4v5a4 4 0 0 1 2.5.86l.17.15c.3.27.71.44 1.14.48l.19.01v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 18c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 18c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 18c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 16c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5a3.96 3.96 0 0 1 2.44-1H16v-5H4V9h12V7a2 2 0 0 0-4-.15V7h-2a4 4 0 0 1 7-2.65A3.98 3.98 0 0 1 20 3zm-2 13.52.46.31.21.18c.35.31.83.49 1.33.49a2 2 0 0 0 1.2-.38l.13-.11c.2-.19.43-.35.67-.49V11h-4zM20 5a2 2 0 0 0-2 1.85V9h4V7a2 2 0 0 0-2-2z"></path>
                    </svg>
                    수영장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M19 1v2H4v14h1.27a7.52 7.52 0 0 1 3.75-4.65 4.5 4.5 0 1 1 6.96 0A7.51 7.51 0 0 1 19.73 17H28v-4.97h2V29c0 1.05-1 2-2 2H4c-1.05 0-2-1-2-2V3c0-1.05 1-2 2-2h15zM4 19v10h24V19H4zm8.5-12a2.5 2.5 0 0 0-1.15 4.72l.15.07v1.8A5.5 5.5 0 0 0 7.37 17h10.25a5.51 5.51 0 0 0-3.9-3.36l-.22-.05v-1.8a2.5 2.5 0 0 0-1-4.79zM28 1h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V12h-2c0-2.16.52-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15V1zm-5 0h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V12h-2c0-2.16.52-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15V1z"></path>
                    </svg>
                    사우나
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M11 23H5v4h20.59L2.29 3.7l1.42-1.4L27 25.58V5h-4v6h-8V9h6V3h8v24.59l.7.7-1.4 1.42-.72-.71H3v-8h6v-6h2z"></path>
                    </svg>
                    단층 주택(숙소에 계단 없음)
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_garageAndEtc"
               class="screens-room-roomEnroll__facility"
               value="0">

        <div>서비스</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M2 31a1 1 0 0 1-1-1 9 9 0 0 1 17.95-1H21c.74 0 1.43-.27 1.97-.74A2.99 2.99 0 0 0 24 26.2L24 26V14H13v6h-2v-7a1 1 0 0 1 .88-1H25a1 1 0 0 1 1 .88V15h4a1 1 0 0 1 1 .88V25a1 1 0 0 1-.88 1H26a4.99 4.99 0 0 1-1.71 3.77 4.98 4.98 0 0 1-3.03 1.22L21 31zm3.85-6.64a7 7 0 0 0-2.7 4.16l-.05.3-.03.18h4.1zM10 23c-.82 0-1.61.14-2.35.4l1.6 5.6h1.5l1.6-5.6a6.97 6.97 0 0 0-1.86-.38l-.25-.02zm4.15 1.36L12.82 29h4.1l-.02-.18a7 7 0 0 0-2.75-4.46zM29 17h-3v7h3zM20 1c0 2.06-.48 3.34-1.77 5.42l-.75 1.19C16.6 9 16.2 9.9 16.06 11h-2.02c.15-1.61.71-2.84 1.91-4.73l.57-.88c1.11-1.79 1.47-2.78 1.47-4.4zm5 0c0 2.06-.48 3.34-1.77 5.42l-.75 1.19C21.6 9 21.2 9.9 21.06 11h-2.02c.15-1.61.71-2.84 1.91-4.73l.57-.88c1.11-1.79 1.47-2.78 1.47-4.4z"></path>
                    </svg>
                    아침식사(아침식사 제공)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M24 0v6h-4.3c.13 1.4.67 2.72 1.52 3.78l.2.22-1.5 1.33a9.05 9.05 0 0 1-2.2-5.08c-.83.38-1.32 1.14-1.38 2.2v4.46l4.14 4.02a5 5 0 0 1 1.5 3.09l.01.25.01.25v8.63a3 3 0 0 1-2.64 2.98l-.18.01-.21.01-12-.13A3 3 0 0 1 4 29.2L4 29.02v-8.3a5 5 0 0 1 1.38-3.45l.19-.18L10 12.9V8.85l-4.01-3.4.02-.7A5 5 0 0 1 10.78 0H11zm-5.03 25.69a8.98 8.98 0 0 1-6.13-2.41l-.23-.23A6.97 6.97 0 0 0 6 21.2v7.82c0 .51.38.93.87 1H7l11.96.13h.13a1 1 0 0 0 .91-.88l.01-.12v-3.52c-.34.04-.69.06-1.03.06zM17.67 2H11a3 3 0 0 0-2.92 2.3l-.04.18-.01.08 3.67 3.1h2.72l.02-.1a4.29 4.29 0 0 1 3.23-3.4zM30 4a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-3-2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5 0h-2.33v2H22zm8-2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM20 20.52a3 3 0 0 0-.77-2l-.14-.15-4.76-4.61v-4.1H12v4.1l-5.06 4.78a3 3 0 0 0-.45.53 9.03 9.03 0 0 1 7.3 2.34l.23.23A6.98 6.98 0 0 0 20 23.6z"></path>
                    </svg>
                    숙박 중 청소 서비스 가능
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M11.67 0v1.67h8.66V0h2v1.67h6a2 2 0 0 1 2 1.85v16.07a2 2 0 0 1-.46 1.28l-.12.13L21 29.75a2 2 0 0 1-1.24.58H6.67a5 5 0 0 1-5-4.78V3.67a2 2 0 0 1 1.85-2h6.15V0zm16.66 11.67H3.67v13.66a3 3 0 0 0 2.82 3h11.18v-5.66a5 5 0 0 1 4.78-5h5.88zm-.08 8h-5.58a3 3 0 0 0-3 2.82v5.76zm-18.58-16h-6v6h24.66v-6h-6v1.66h-2V3.67h-8.66v1.66h-2z"></path>
                    </svg>
                    장기 숙박 가능 (28일 이상 숙박 가능)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M30 29v2H2v-2zM20 1a2 2 0 0 1 2 1.85V5h3a5 5 0 0 1 5 4.78V22a5 5 0 0 1-4.78 5H7a5 5 0 0 1-5-4.78V10a5 5 0 0 1 4.78-5H10V3a2 2 0 0 1 1.85-2H12zm5 6H7a3 3 0 0 0-3 2.82V22a3 3 0 0 0 2.82 3H25a3 3 0 0 0 3-2.82V10a3 3 0 0 0-3-3zm-8 2v9.5l3.3-3.3 1.4 1.42-4.64 4.65-.11.1a1.5 1.5 0 0 1-1.9 0l-.11-.1-4.65-4.65 1.42-1.41L15 18.5V9zm3-6h-8v2h8z"></path>
                    </svg>
                    여행 가방 보관 가능(체크인 시간보다 일찍 도착하거나 체크아웃 후 짐 보관을 원하는 게스트를 위한 서비스
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_service"
               class="screens-room-roomEnroll__facility"
               value="0">
    </div>

    <%--  숙소 전망을 추가하세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 전망을 추가하세요</div>
    <div class="screens-room-roomEnroll__views">
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M30.97 2.26a74.69 74.69 0 0 1-2.73 8.66c-1.63 4.26-3.45 7.41-5.85 10.06l1.46 1.46a3.48 3.48 0 0 1 3.95.46l2.16 2.14a3.48 3.48 0 0 1-4.77 5.06l-2.15-2.14a3.48 3.48 0 0 1-.6-4.1l-1.45-1.45c-4.67 4.4-11.37 7.38-18.83 8.58a1 1 0 0 1-1.13-1.21l.4-1.73C3.38 20.27 5.74 15.08 9.6 11L8.15 9.56A3.48 3.48 0 0 1 4.2 9.1L2.04 6.96A3.48 3.48 0 0 1 6.81 1.9l2.15 2.14a3.48 3.48 0 0 1 .6 4.1l1.46 1.47c4.52-4.06 11.16-7.02 18.78-8.59a1 1 0 0 1 1.17 1.24zm-6.51 22.2a1.48 1.48 0 0 0-.1 1.97l2.1 2.11a1.48 1.48 0 0 0 2.19-1.97l-2.1-2.11a1.48 1.48 0 0 0-2.1 0zM11 12.42c-3.46 3.68-5.67 8.4-7.48 15.5l-.2.83.17-.04c6.4-1.29 12.07-3.96 16.08-7.72L18 19.41l-1.3 1.3a3.83 3.83 0 0 1-5.25.15l-.16-.15a3.83 3.83 0 0 1-.15-5.26L12.58 14l-1.57-1.58zm2.99 3-1.3 1.29a1.83 1.83 0 0 0-.1 2.46l.1.12a1.83 1.83 0 0 0 2.47.12L16.6 18l-2.6-2.59zM28.6 3.3C22.8 4.7 16.9 7 12.4 11l8.5 8.5c3.71-4.08 5.7-9.3 7.24-14.57l.46-1.63zm-6.7 6.8a3.83 3.83 0 0 1 .15 5.26L20.9 16.5l-1.41-1.41.99-.99a1.83 1.83 0 0 0 .1-2.46l-.1-.12a1.83 1.83 0 0 0-2.47-.12l-1.1 1.1-1.42-1.41.99-.99a3.83 3.83 0 0 1 5.41 0zM3.46 3.46a1.48 1.48 0 0 0-.1 1.97l2.1 2.11a1.48 1.48 0 0 0 2.19-1.97l-2.1-2.11a1.48 1.48 0 0 0-2.1 0z"></path>
                    </svg>
                    계곡
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M24 27c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 29c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 29c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 29c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 27c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 27c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 27zm0-5c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 24c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 24c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 24c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 22c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 22c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 22zm0-5c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 19c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 19c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 19c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 17c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 17c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 17zM16 1a9 9 0 0 1 8.76 11.07c.71.13 1.37.45 1.91.94.3.27.71.44 1.14.48l.19.01v2h-.23a3.96 3.96 0 0 1-2.44-1 1.95 1.95 0 0 0-1.14-.5H23.96a2 2 0 0 0-1.15.38l-.14.11A3.98 3.98 0 0 1 20 15.5a3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 14c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1 1.95 1.95 0 0 0-1.14-.5H7.96a2 2 0 0 0-1.15.38l-.14.11a3.96 3.96 0 0 1-2.44 1L4 15.5v-2h.19a1.95 1.95 0 0 0 1.14-.5 3.92 3.92 0 0 1 1.9-.93A9 9 0 0 1 16 1zm0 2a7 7 0 0 0-6.64 9.23c.49.17.93.43 1.31.78.35.32.83.49 1.33.49.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 12c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5a2 2 0 0 0 1.2-.38l.13-.11c.38-.35.82-.6 1.3-.78A7 7 0 0 0 16 3z"></path>
                    </svg>
                    해변
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M28 2a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H4a2 2 0 0 1-2-1.85V4a2 2 0 0 1 1.85-2H4zM15 13H9v8H4v7h24v-7h-3v4H15zm-3 10a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM28 4H4v15h3v-6a2 2 0 0 1 1.85-2H15a2 2 0 0 1 2 1.85V23h6v-2a2 2 0 0 1 1.85-2H28zM12 19a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-4a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm10-8a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path>
                    </svg>
                    도시
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M16 1a5 5 0 0 1 5 5 5 5 0 0 1 0 10 5 5 0 0 1-4 4.9v4.29A9.04 9.04 0 0 1 23.95 22a8.94 8.94 0 0 1 3.74.81l.31.15v2.33A6.96 6.96 0 0 0 23.95 24a6.88 6.88 0 0 0-6.93 5.87l-.02.15v.1a1 1 0 0 1-.88.87L16 31a1 1 0 0 1-.97-.77l-.02-.12A6.95 6.95 0 0 0 7.97 24 6.96 6.96 0 0 0 4 25.23v-2.31a9.16 9.16 0 0 1 11 2.3V20.9a5 5 0 0 1-4-4.68V16h-.22a5 5 0 0 1 0-10H11v-.22A5 5 0 0 1 16 1zm2.86 14.1a4.98 4.98 0 0 1-5.72 0l-.07.23a3 3 0 1 0 5.85 0zM11 8a3 3 0 1 0 .67 5.93l.23-.07A4.98 4.98 0 0 1 11 11c0-1.06.33-2.05.9-2.86l-.23-.07A3.01 3.01 0 0 0 11 8zm10 0c-.23 0-.45.03-.67.07l-.23.07c.57.8.9 1.8.9 2.86a4.98 4.98 0 0 1-.9 2.86l.23.07A3 3 0 1 0 21 8zm-5 0a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm0-5a3 3 0 0 0-2.93 3.67l.07.23a4.98 4.98 0 0 1 5.72 0l.07-.23A3 3 0 0 0 16 3z"></path>
                    </svg>
                    마당
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M16 1a5 5 0 0 1 5 5 5 5 0 0 1 0 10 5 5 0 0 1-4 4.9v4.29A9.04 9.04 0 0 1 23.95 22a8.94 8.94 0 0 1 3.74.81l.31.15v2.33A6.96 6.96 0 0 0 23.95 24a6.88 6.88 0 0 0-6.93 5.87l-.02.15v.1a1 1 0 0 1-.88.87L16 31a1 1 0 0 1-.97-.77l-.02-.12A6.95 6.95 0 0 0 7.97 24 6.96 6.96 0 0 0 4 25.23v-2.31a9.16 9.16 0 0 1 11 2.3V20.9a5 5 0 0 1-4-4.68V16h-.22a5 5 0 0 1 0-10H11v-.22A5 5 0 0 1 16 1zm2.86 14.1a4.98 4.98 0 0 1-5.72 0l-.07.23a3 3 0 1 0 5.85 0zM11 8a3 3 0 1 0 .67 5.93l.23-.07A4.98 4.98 0 0 1 11 11c0-1.06.33-2.05.9-2.86l-.23-.07A3.01 3.01 0 0 0 11 8zm10 0c-.23 0-.45.03-.67.07l-.23.07c.57.8.9 1.8.9 2.86a4.98 4.98 0 0 1-.9 2.86l.23.07A3 3 0 1 0 21 8zm-5 0a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm0-5a3 3 0 0 0-2.93 3.67l.07.23a4.98 4.98 0 0 1 5.72 0l.07-.23A3 3 0 0 0 16 3z"></path>
                    </svg>
                    정원
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M21 3a2 2 0 0 1 2 1.85V12a7 7 0 0 1-2.23 5.12l-.2.18-.02.02.28.1A13.01 13.01 0 0 1 28.91 28H26.9a11 11 0 0 0-8.8-9.3l-.1-.02v-2.1a5 5 0 0 0 2.98-4.12l.02-.23V9H11v3a5 5 0 0 0 3 4.58v2.1a10.92 10.92 0 0 0-3 1.02V28H9v-6.99a11 11 0 0 0-3.9 7L3.1 28a13.02 13.02 0 0 1 7.8-10.46l.28-.11.28-.11-.23-.2a7 7 0 0 1-2.2-4.55l-.01-.3L9 12V5a2 2 0 0 1 1.85-2H11zm-3 23a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4-4a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7-17H11v2h10z"></path>
                    </svg>
                    골프장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M2.61 1h13.34c.28-.02.58.08.8.33l.08.12 12 18a1 1 0 0 1-.72 1.54L28 21H17v2h12v1c0 1.84-.62 3.53-1.66 4.88l.13.1c.36.3.83.48 1.34.51l.19.01v2c-.95 0-1.87-.29-2.61-.83l-.2-.15c-.4-.33-.94-.52-1.52-.52-.52 0-1.01.15-1.4.41l-.13.1c-.77.65-1.77.99-2.8.99-.96 0-1.88-.29-2.62-.83l-.2-.15c-.4-.33-.94-.52-1.52-.52-.52 0-1 .15-1.39.41l-.14.1c-.76.65-1.77.99-2.8.99-.95 0-1.87-.29-2.61-.83l-.2-.15c-.4-.33-.95-.52-1.53-.52-.51 0-1 .15-1.38.41l-.14.1c-.7.6-1.6.93-2.55.98L3 31.5v-2c.52 0 1-.15 1.39-.41l.27-.21a7.99 7.99 0 0 1-1.64-4.3L3 24.26 2.98 23H15V9H2.61l1.34-4zm24.3 24H5.09l.02.09c.2 1.13.73 2.16 1.48 2.97a4.48 4.48 0 0 1 3.56.92c.4.33.95.52 1.53.52a2.4 2.4 0 0 0 1.52-.52A4.38 4.38 0 0 1 16 28c.95 0 1.87.29 2.61.83l.2.15c.4.33.94.52 1.52.52.52 0 1.01-.15 1.4-.41l.13-.1a4.38 4.38 0 0 1 3.3-.96l.25.03.08-.08a5.97 5.97 0 0 0 1.35-2.6l.06-.28zM17 5.3V19h9.13zM5.39 3l.66 2-.66 2H15V3z"></path>
                    </svg>
                    항구
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M28 2a2 2 0 0 1 2 2v24a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2zm0 2H4v15.5h.19c.37-.04.72-.17 1-.38l.14-.11A3.98 3.98 0 0 1 8 18c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 18c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 18c.99 0 1.94.35 2.67 1 .35.33.83.5 1.33.5v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1v3h.19c.37-.04.72-.17 1-.38l.14-.11A3.98 3.98 0 0 1 8 23c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 23c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 23c.99 0 1.94.35 2.67 1 .35.33.83.5 1.33.5v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1V28h24zm-6 3a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path>
                    </svg>
                    호수
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M28 2a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H4a2 2 0 0 1-2-1.85V4a2 2 0 0 1 1.85-2H4zm-5.92 20H9.92L4 27.91V28h24v-.09zM28 4H4v21.08l12-12 12 12zM16 15.91 11.91 20h8.17zM22 7a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path>
                    </svg>
                    산
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M28 2a2 2 0 0 1 2 2v24a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2zm0 2H4v15.5h.19c.37-.04.72-.17 1-.38l.14-.11A3.98 3.98 0 0 1 8 18c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 18c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 18c.99 0 1.94.35 2.67 1 .35.33.83.5 1.33.5v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1v3h.19c.37-.04.72-.17 1-.38l.14-.11A3.98 3.98 0 0 1 8 23c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 23c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 23c.99 0 1.94.35 2.67 1 .35.33.83.5 1.33.5v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1V28h24zm-6 3a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path>
                    </svg>
                    바다
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M16 1a5 5 0 0 1 5 5 5 5 0 0 1 0 10 5 5 0 0 1-4 4.9v4.29A9.04 9.04 0 0 1 23.95 22a8.94 8.94 0 0 1 3.74.81l.31.15v2.33A6.96 6.96 0 0 0 23.95 24a6.88 6.88 0 0 0-6.93 5.87l-.02.15v.1a1 1 0 0 1-.88.87L16 31a1 1 0 0 1-.97-.77l-.02-.12A6.95 6.95 0 0 0 7.97 24 6.96 6.96 0 0 0 4 25.23v-2.31a9.16 9.16 0 0 1 11 2.3V20.9a5 5 0 0 1-4-4.68V16h-.22a5 5 0 0 1 0-10H11v-.22A5 5 0 0 1 16 1zm2.86 14.1a4.98 4.98 0 0 1-5.72 0l-.07.23a3 3 0 1 0 5.85 0zM11 8a3 3 0 1 0 .67 5.93l.23-.07A4.98 4.98 0 0 1 11 11c0-1.06.33-2.05.9-2.86l-.23-.07A3.01 3.01 0 0 0 11 8zm10 0c-.23 0-.45.03-.67.07l-.23.07c.57.8.9 1.8.9 2.86a4.98 4.98 0 0 1-.9 2.86l.23.07A3 3 0 1 0 21 8zm-5 0a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm0-5a3 3 0 0 0-2.93 3.67l.07.23a4.98 4.98 0 0 1 5.72 0l.07-.23A3 3 0 0 0 16 3z"></path>
                    </svg>
                    공원
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M24 26c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 28c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 28c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 28c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 26c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 26c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 26zm0-5c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 23c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 23c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 23c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 21c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 21c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 21zM20 3a4 4 0 0 1 4 3.8V9h4v2h-4v5a4 4 0 0 1 2.5.86l.17.15c.3.27.71.44 1.14.48l.19.01v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 18c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 18c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 18c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 16c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5a3.96 3.96 0 0 1 2.44-1H16v-5H4V9h12V7a2 2 0 0 0-4-.15V7h-2a4 4 0 0 1 7-2.65A3.98 3.98 0 0 1 20 3zm-2 13.52.46.31.21.18c.35.31.83.49 1.33.49a2 2 0 0 0 1.2-.38l.13-.11c.2-.19.43-.35.67-.49V11h-4zM20 5a2 2 0 0 0-2 1.85V9h4V7a2 2 0 0 0-2-2z"></path>
                    </svg>
                    수영장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M21.54.8a13.67 13.67 0 0 1 9.74 16.43l-.08.3-.26.97-12.35-3.3-3.86 14.13h-2.07l4-14.66-12.12-3.24.26-.97A13.67 13.67 0 0 1 21.54.8zM5.67 21a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM25.33 4.92l.05.17c.74 2.34.77 5.38 0 8.5l-.1.33-.24.93 4.45 1.2.03-.2c.68-4.21-1-8.36-4.2-10.93zm-3.46-1.75-2.75 10.1 3.99 1.06.25-.93c1.23-4.6.44-8.83-1.5-10.23zm-1.95-.45c-2.28.38-4.9 3.46-6.14 7.79l-.08.3-.25.93 3.73 1zm-3.67-.26-.22.04a11.68 11.68 0 0 0-8.8 7.03l-.13.31-.07.19 4.48 1.2.25-.94c.9-3.33 2.55-6.12 4.5-7.83z"></path>
                    </svg>
                    리조트
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path d="M24 26c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 28c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 28c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 28c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 26c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 26c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 26zm0-5c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 23c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 23c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 23c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 21c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 21c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 21zM20 3a4 4 0 0 1 4 3.8V9h4v2h-4v5a4 4 0 0 1 2.5.86l.17.15c.3.27.71.44 1.14.48l.19.01v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 18c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 18c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 18c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 16c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5a3.96 3.96 0 0 1 2.44-1H16v-5H4V9h12V7a2 2 0 0 0-4-.15V7h-2a4 4 0 0 1 7-2.65A3.98 3.98 0 0 1 20 3zm-2 13.52.46.31.21.18c.35.31.83.49 1.33.49a2 2 0 0 0 1.2-.38l.13-.11c.2-.19.43-.35.67-.49V11h-4zM20 5a2 2 0 0 0-2 1.85V9h4V7a2 2 0 0 0-2-2z"></path>
                    </svg>
                    강
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_view"
               class="screens-room-roomEnroll__view"
               value="0">
    </div>

    <%--  숙소 이름을 지어주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 이름을 지어주세요 <span
            class="screens-room-roomEnroll__required-input">(필수 입력)</span></div>
    <div class="screens-room-roomEnroll__sub-title">
        숙소 이름은 짧을수록 효과적입니다. 나중에 언제든지 변경할 수 있으니, 너무 걱정하지 마세요.
    </div>
    <textarea name="room_name"
              class="screens-room-roomEnroll__textarea screens-room-roomEnroll__textarea-room-name"></textarea>

    <%--  숙소 장점을 적어주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 장점을 적어주세요</div>
    <div class="screens-room-roomEnroll__sub-title">
        숙소의 특징과 장점을 알려주세요.
    </div>
    <textarea name="room_total_desc" class="screens-room-roomEnroll__textarea"></textarea>

    <%--  숙소 공간에 대해 설명해주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 공간에 대해 설명해주세요</div>
    <div class="screens-room-roomEnroll__sub-title">
        숙소 공간을 자세히 설명해주세요.
    </div>
    <textarea name="room_space_desc" class="screens-room-roomEnroll__textarea"></textarea>

    <%--  숙소 기타 참고할점을 적어주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 기타 참고할점을 적어주세요</div>
    <div class="screens-room-roomEnroll__sub-title">
        숙소 사용시 주의할점과 참고할점이 있다면 자세히 적어주세요.
    </div>
    <textarea name="room_etc_desc" class="screens-room-roomEnroll__textarea"></textarea>

    <%--  숙소 가격을 책정해주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 가격을 책정해주세요 <span
            class="screens-room-roomEnroll__required-input">(필수 입력)</span></div>
    <div class="screens-room-roomEnroll__sub-title">
        언제든지 변경하실 수 있습니다.
    </div>
    <div class="screens-room-roomEnroll__price">
        <div class="screens-room-roomEnroll__price-title">
            주중 1박 요금
        </div>
        <div class="screens-room-roomEnroll__price-input-container">
            <span>₩</span>
            <input name="room_weekday_price" class="screens-room-roomEnroll__input-price"
                   type="number" value="50000">
        </div>

        <div class="screens-room-roomEnroll__price-title">
            주말 1박 요금
        </div>
        <div class="screens-room-roomEnroll__price-input-container">
            <span>₩</span>
            <input name="room_weekend_price" class="screens-room-roomEnroll__input-price"
                   type="number" value="70000">
        </div>

        <div class="screens-room-roomEnroll__price-title">
            인원 추가 요금
        </div>
        <div class="screens-room-roomEnroll__price-input-container">
            <span>₩</span>
            <input name="room_extra_person_fee" class="screens-room-roomEnroll__input-price"
                   type="number" value="10000">
        </div>
    </div>

    <input type="submit" class="screens-room-roomEnroll__btn-submit" value="숙소 사진 등록">
</form>

<jsp:include page="/WEB-INF/views/common/user/footerNotFix.jsp"/>

<%--<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>--%>

<%-- 숙소 주소 입력 Script --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 카카오 지도 API : services 라이브러리 불러오기 -->
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${KakaoApiKey}&libraries=services"></script>
<%-- Script --%>
<script src="/resources/js/room/roomEnroll.js"></script>
<script>
  let dropdowns = document.querySelectorAll(
      '.components-user-header__dropdown-div');

  document.addEventListener("click", function (e) {
    if (e.target.classList.contains(
            "components-user-header__header__searchbar__main_txt") ||
        e.target.classList.contains(
            "components-user-header__header__searchbar__sub_txt") ||
        e.target.classList.contains(
            "components-user-header__header__profile__my-profile") ||
        e.target.classList.contains(
            "components-user-header__header__profile__my-profile__btn")
        ||
        e.target.classList.contains(
            "components-user-header__header__profile__hamburger") ||
        e.target.classList.contains(
            "components-user-header__header__profile__img") ||
        e.target.classList.contains(
            "components-user-header__header__searchbar__checkin-btn")
    ) {
      console.log(1);
      return;
    }

    dropdowns.forEach(dropdown => {
      if (dropdown.classList.contains("show")) {
        dropdown.classList.remove("show");
      }
    });
  });

  dropdowns.forEach(dropdown => {
    dropdown.addEventListener('click', function (event) {
      event.stopPropagation(); // 드롭다운 요소가 클릭되었을 때 이벤트 전파 중단
    });
  });

  //-----------------------------------------------------------------

  //코드에 중복이 많아서 해결하고 싶음.
  const dropdownDiv = document.getElementsByClassName(
      "components-user-header__dropdown-div");

  const toggleDropdown4 = function () {
    dropdownDiv[0].classList.toggle('show')
  }

  //마이프로필 버튼 이벤트 추가
  const headerMyProfileBtn = document.querySelector(
      ".components-user-header__header__profile__my-profile__btn");

  headerMyProfileBtn.addEventListener("click", toggleDropdown4);
</script>

</body>
</html>
