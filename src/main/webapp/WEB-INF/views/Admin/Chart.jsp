<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>Insert title here</title> -->
<c:set var="mcount" value="${mcount}"/>
<c:set var="pcount" value="${pcount}"/>
<c:set var="PscountList" value="${PscountList}"/>
<c:set var="PpcountList" value="${PpcountList}"/>
<c:set var="PfcountList" value="${PfcountList}"/>
<c:set var="MscountList" value="${MscountList}"/>
<c:set var="MpcountList" value="${MpcountList}"/>
<c:set var="stateList" value="${stateList}"/>
				<!-- Chart.js -->
<script type="text/javascript"></script>
</head>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link type="text/css"
	href="/css/adminChart.css"
	rel="stylesheet">

<body>

	<main>
		<div class="section">
			<div class="container">
				<div class="mpcount" >
					<div class="card mcount">
						<div class="card-body ">활동중인 회원 수<div class="mcountdiv"></div></div>
					</div>
					<div class="card pcount">
						<div class="card-body">지금까지 생성된 프로젝트 수<div class="pcountdiv"></div></div>
					</div>
				</div>
				<div class="card">
					<div class="card-body"><canvas id="SkillChart"></canvas></div>
				</div>
				
				<div class="card">
					<div class="card-body"><canvas id="PositionChart"></canvas></div>
				</div>
				
				<div class="card">
					<div class="card-body"><canvas id="FieldChart"></canvas></div>
				</div>
				
				<div class="card">
					<div class="card-body"><canvas id="StateChart"></canvas></div>
				</div>

				
			</div>
		</div>
	</main>

</body>

<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script type="text/javascript">
var mcount= ${mcount};
var pcount= ${pcount};
const Slabels=[];
const PScountdata=[];
const MScountdata=[];

const Plabels=[];
const PPcountdata=[];
const MPcountdata=[];

const Flabels=[];
const PFcountdata=[];
const MFcountdata=[];

const STlabels=[];
const STcountdata=[];


//스킬
<c:forEach var="p" items="${PscountList }">
	Slabels.unshift("${p.name}");
	PScountdata.unshift("${p.count}")
</c:forEach>
<c:forEach var="m" items="${MscountList }">
	MScountdata.unshift("${m.count}")
</c:forEach>
//포지션
<c:forEach var="p" items="${PpcountList }">
	Plabels.unshift("${p.name}");
	PPcountdata.unshift("${p.count}")
</c:forEach>
<c:forEach var="m" items="${MpcountList }">
	MPcountdata.unshift("${m.count}")
</c:forEach>
//필드
<c:forEach var="p" items="${PfcountList }">
	Flabels.unshift("${p.name}");
	PFcountdata.unshift("${p.count}");
</c:forEach>

//상태
<c:forEach var="st" items="${stateList }">
	STlabels.unshift("${st.p_state}");
	STcountdata.unshift("${st.count}");
</c:forEach>


const Sdata = {
  labels: Slabels,
  datasets: [
	    {
      label: '프로젝트',
      data: PScountdata,
      borderColor: 'blue',
      backgroundColor: 'blue',
		type:'bar',
		 yAxisID: 'y1'
    },
    {
      label: '회원',
      data: MScountdata,
      borderColor: 'rgb(255, 99, 132)',
      backgroundColor: 'rgb(255, 99, 132)',
      type: 'bar',
 		yAxisID: 'y'
    }

  ]
};

const Pdata = {
  labels: Plabels,
  datasets: [
	    {
      label: '프로젝트',
      data: PPcountdata,
      borderColor: 'blue',
      backgroundColor: 'blue',
		type:'bar',
		 yAxisID: 'y1'
    },
    {
      label: '회원',
      data: MPcountdata,
      borderColor: 'rgb(255, 99, 132)',
      backgroundColor: 'rgb(255, 99, 132)',
      type: 'bar',
 		yAxisID: 'y'
    }

  ]
};
		
const Fdata = {
		  labels: Flabels,
		  datasets: [
			    {
		      label: '프로젝트',
		      data: PFcountdata,
		      borderColor: 'blue',
		      backgroundColor: 'blue',
				type:'bar',
				 yAxisID: 'y1'
		    }

		  ]
		};
const Statedata = {
		  labels: STlabels,
		  datasets: [
		    {
		      label: '상태별 프로젝트 수',
		      data: STcountdata,
		      backgroundColor: ['red', 'blue', 'green'],
		    }
		  ]
		};
</script>
<script type="text/javascript" src="/assets/js/adminChart.js"></script>
</html>