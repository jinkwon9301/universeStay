<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<spring:eval expression="@OauthProperties['KAKAO_JavaScript_KEY']" var="KakaoApiKey"/>
<%
    String isHost = (String) request.getAttribute("isHost");
%>
<html>
<head>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <title>숙소 수정하기</title>
</head>

<body>
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

<form action="/room/modify" method="post" class="screens-room-roomEnroll__wrapper">

    <%--  숙소 유형을 선택하세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 유형을 선택하세요</div>
    <div class="screens-room-roomEnroll__dropdown">
        <input name="" type="text" class="screens-room-roomEnroll__dropdown__textBox"
               placeholder="숙소 유형을 선택하세요" value="${roomCategoryName}">
        <input name="room_category_id" type="hidden"
               class="screens-room-roomEnroll__dropdown__valueBox"
               value="${roomDto.room_category_id}">
        <input name="room_id" type="hidden"
               class="screens-room-modifyRoom__room_id"
               value="${roomDto.room_id}">
        <input name="created_at" type="hidden"
               class="screens-room-modifyRoom__room_created_at"
               value="${roomDto.created_at}">
        <input name="created_id" type="hidden"
               class="screens-room-modifyRoom__room_created_id"
               value="${roomDto.created_id}">
        <input name="updated_at" type="hidden"
               class="screens-room-modifyRoom__room_updated_at"
               value="${roomDto.updated_at}">
        <input name="updated_id" type="hidden"
               class="screens-room-modifyRoom__room_updated_id"
               value="${roomDto.updated_id}">


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
    <div class="screens-room-roomEnroll__title">숙소의 위치는 어디인가요?</div>
    <div class="screens-room-roomEnroll__input__address">
        <input type="text" name="room_address" class="screens-room-roomEnroll__address-main"
               placeholder="주소" readonly value="${roomDto.room_address}">
        <input type="button" class="screens-room-roomEnroll__btn-address-main"
               onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
        <input type="text" name="room_address_detail"
               class="screens-room-roomEnroll__address-detail" placeholder="상세 주소 입력"
               value="${roomDto.room_address_detail}"><br>
        <div class="screens-room-roomEnroll__map"
             style="width:100%;height:300px;margin-top:10px;display:none"></div>
    </div>

    <%--  숙소 기본정보를 알려주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 기본정보를 알려주세요</div>
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
                       name="room_standard_capa" value='${roomDto.room_standard_capa}' readonly/>
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
                       name="room_max_capa" value='${roomDto.room_max_capa}' readonly/>
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
                       name="room_bedroom_cnt" value='${roomDto.room_bedroom_cnt}' readonly/>
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
                       name="room_bed_cnt" value='${roomDto.room_bed_cnt}' readonly/>
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
                       name="room_bathroom_cnt" value='${roomDto.room_bathroom_cnt}' readonly/>
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
                    욕조
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    비데
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    바디클렌저
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    청소용품
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    컨디셔너
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    헤어드라이어
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    온수
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    야외
                    샤워 시설
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    샴푸
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_bath" class="screens-room-roomEnroll__facility"
               value="${roomAmenityDto.room_amenity_bath}">

        <div>침실 및 세탁시설</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    필수품목(수건, 침대시트, 비누, 화장지, 베개)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    침구
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    의류 보관 공간
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    건조기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    의류 건조대
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    여분의 베개와 담요
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    옷걸이
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    다리미
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    모기장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    암막커튼
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    금고
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    세탁기
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_bedAndLaundry"
               class="screens-room-roomEnroll__facility"
               value="${roomAmenityDto.room_amenity_bedAndLaundry}">

        <div>엔터테인먼트</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    오락실 게임
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    야구 연습장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    도서 및 읽을거리
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    볼링장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    운동 기구
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    게임기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    영화관
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    피아노
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    탁구대
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    당구대
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    스피커
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    Tv
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_entertain"
               class="screens-room-roomEnroll__facility"
               value="${roomAmenityDto.room_amenity_entertain}">

        <div>숙소 안전</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    일산화탄소 경보기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    소화기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    난방
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    화재 경보기
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_safety"
               class="screens-room-roomEnroll__facility"
               value="${roomAmenityDto.room_amenity_safety}">

        <div>냉난방</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    에어컨
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    선풍기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    난방
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    벽난로
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_heatAndCold"
               class="screens-room-roomEnroll__facility"
               value="${roomAmenityDto.room_amenity_heatAndCold}">

        <div>인터넷 및 업무 공간</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    업무 전용 공간(테이블, 의자)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    포켓 와이파이
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    무선 인터넷
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_internetAndWorkSpace"
               class="screens-room-roomEnroll__facility"
               value="${roomAmenityDto.room_amenity_internetAndWorkSpace}">

        <div>주방 및 식당</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    바베큐 도구
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    제빵기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    믹서기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    커피
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    커피 메이커
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    기본 조리도구(냄비, 후라이팬, 기름, 소금, 후추 등)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    식탁
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    식기류(그릇, 젓가락, 접시, 컵 등)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    식기 세척기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    냉동고
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    주방
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    전자레인지
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    오븐
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    냉장고
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    전기 밥솥
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    가스레인지 / 인덕션
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    와인잔
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_kitchen"
               class="screens-room-roomEnroll__facility"
               value="${roomAmenityDto.room_amenity_kitchen}">

        <div>야외</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    뒷마당
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    바베큐 그릴
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    해수욕 필수품 (비치타월, 우산, 해변용 담요, 스노클링 장비 등)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    자전거
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    화로
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    해먹
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    카약
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    야외 식사 공간
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    야외 가구
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    야외 주방
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    발코니
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    선베드
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_outdoor"
               class="screens-room-roomEnroll__facility"
               value="${roomAmenityDto.room_amenity_outdoor}">

        <div>주차장 및 기타 시설</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    엘리베이터
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    전기차 충전 시설
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    건물 내 무료 주차
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    도로 주차(무료)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    헬스장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    온수 욕조
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    외부 유료 주차
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    건물 내 유료 주차
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    수영장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    사우나
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    단층 주택(숙소에 계단 없음)
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_garageAndEtc"
               class="screens-room-roomEnroll__facility"
               value="${roomAmenityDto.room_amenity_garageAndEtc}">

        <div>서비스</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    아침식사(아침식사 제공)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    숙박 중 청소 서비스 가능
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    장기 숙박 가능 (28일 이상 숙박 가능)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    여행 가방 보관 가능(체크인 시간보다 일찍 도착하거나 체크아웃 후 짐 보관을 원하는 게스트를 위한 서비스
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_service"
               class="screens-room-roomEnroll__facility"
               value="${roomAmenityDto.room_amenity_service}">
    </div>

    <%--  숙소 전망을 추가하세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 전망을 추가하세요</div>
    <c:forEach var="view" items="${roomViewDtoList}">
        <input type="hidden" value="${view.view_status_id}" class="hiddenView">
    </c:forEach>

    <div class="screens-room-roomEnroll__views">
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    계곡
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    해변
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    도시
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    마당
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    정원
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    골프장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    항구
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    호수
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    산
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    바다
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    공원
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    수영장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    리조트
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button type="button"
                        class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    강
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_view"
               class="screens-room-roomEnroll__view"
               value="0">

    </div>

    <%--  숙소 이름을 지어주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 이름을 지어주세요</div>
    <div class="screens-room-roomEnroll__sub-title">
        숙소 이름은 짧을수록 효과적입니다. 나중에 언제든지 변경할 수 있으니, 너무 걱정하지 마세요.
    </div>
    <textarea name="room_name"
              class="screens-room-roomEnroll__textarea">${roomDto.room_name}</textarea>

    <%--  숙소 장점을 적어주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 장점을 적어주세요</div>
    <div class="screens-room-roomEnroll__sub-title">
        숙소의 특징과 장점을 알려주세요.
    </div>
    <textarea name="room_total_desc"
              class="screens-room-roomEnroll__textarea">${roomDto.room_total_desc}</textarea>

    <%--  숙소 공간에 대해 설명해주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 공간에 대해 설명해주세요</div>
    <div class="screens-room-roomEnroll__sub-title">
        숙소 공간을 자세히 설명해주세요.
    </div>
    <textarea name="room_space_desc"
              class="screens-room-roomEnroll__textarea">${roomDto.room_space_desc}</textarea>

    <%--  숙소 기타 참고할점을 적어주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 기타 참고할점을 적어주세요</div>
    <div class="screens-room-roomEnroll__sub-title">
        숙소 사용시 주의할점과 참고할점이 있다면 자세히 적어주세요.
    </div>
    <textarea name="room_etc_desc"
              class="screens-room-roomEnroll__textarea">${roomDto.room_etc_desc}</textarea>

    <%--  숙소 가격을 책정해주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 가격을 책정해주세요</div>
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
                   type="number" value="${roomDto.room_weekday_price}">
        </div>

        <div class="screens-room-roomEnroll__price-title">
            주말 1박 요금
        </div>
        <div class="screens-room-roomEnroll__price-input-container">
            <span>₩</span>
            <input name="room_weekend_price" class="screens-room-roomEnroll__input-price"
                   type="number" value="${roomDto.room_weekend_price}">
        </div>

        <div class="screens-room-roomEnroll__price-title">
            인원 추가 요금
        </div>
        <div class="screens-room-roomEnroll__price-input-container">
            <span>₩</span>
            <input name="room_extra_person_fee" class="screens-room-roomEnroll__input-price"
                   type="number" value="${roomDto.room_extra_person_fee}">
        </div>
    </div>

    <input type="submit" class="screens-room-roomEnroll__btn-submit" value="목록으로 이동"
           onclick="'/room/management'">
    <input type="submit" class="screens-room-roomEnroll__btn-submit" value="저장하기"
           onclick="location.href='/room/modify'">
</form>

<%--<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>--%>

<%-- 숙소 주소 입력 Script --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 카카오 지도 API : services 라이브러리 불러오기 -->
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${KakaoApiKey}&libraries=services"></script>
<%-- Script --%>
<script src="/resources/js/room/roomEnroll.js"></script>
<script src="/resources/js/room/roomModify.js"></script>

<script type="module"
        src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script type="text/javascript"
        src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
        src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
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
