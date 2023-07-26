<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>프로그램 사업자 목록</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/proList.css">
    <script>
        $(function(){
            //메시지 출력 부분
            let m = "${msg}";
            if(m != ""){
                alert(m);
            }
        })
    </script>
    <style>
        #banner{
            background-color: #4999e4;
            width: 1070px;
            height: 60px;
            display: flex;
            align-items: center;
            border-radius: 15px;
            margin: 0 auto;
        }
        #banner h1 {
            margin-left: 20px;
        }
        .t-button{
            width: 20%;
            height: 60px;
        }
        section{
            margin-bottom: 500px;
        }
        #pname{
            margin-top: 15px;
            font-size: medium;
            line-height: 34px;
        }
        #ptime{
            margin-top: 15px;
            font-size: medium;
            line-height: 34px;
        }
        #pkind{
            margin-top: 15px;
            font-size: medium;
            line-height: 34px;
        }
        #psubject{
            margin-top: 15px;
            font-size: medium;
            line-height: 34px;
        }
    </style>
</head>
<body>
<div class="wrap">
    <header><jsp:include page="headerAfter.jsp"></jsp:include></header>
    <section>
        <div id="banner"><h1>프로그램 목록</h1></div>
        <div class="content">
            <div class="program-form">
                <div class="data-area">
                    <div class="title-row">
                        <div class="t-cname" id="title-name">센터 이름</div>
                        <div class="t-addr">센터 위치</div>
                        <div class="t-kind">프로그램 종류</div>
                        <div class="t-time">시간</div>
                        <div class="t-subject">대상자</div>
                        <div class="t-button" id="title-button"></div>
                    </div>
                    <div class="data-row">
                        <c:if test="${empty proinfo}">
                            <div style="width: 100%">
                                등록된 프로그램이 없습니다.
                            </div>
                        </c:if>
                        <c:if test="${!empty proinfo}">
                            <c:forEach var="pitem" items="${proinfo}">
                                <div class="t-cname" id="pname">${pitem.proname}</div>
                                <div class="t-addr" id="ptime">${pitem.paddr}</div>
                                <div class="t-kind" id="pkind">${pitem.pkind}</div>
                                <div class="t-time" id="ptime">${pitem.ptime}</div>
                                <div class="t-subject" id="psubject">${pitem.psubject}</div>
                                <div class="t-button">
                                    <input type="button" value="신청" id="pUpBtn" class="upbtn" onclick="pBook(${pitem.p_no},'${pitem.p_pid}')">
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="btn-area">
                <button class="wr-btn"
                        onclick="location.href='/homeAfter'">뒤로가기</button>
            </div>
        </div>

    </section>
        <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
<script>
    function pBook(p_no, p_pid){
        location.href = "/proBook?p_no=" + p_no + "&p_pid=" + p_pid;
    }
</script>
</html>
