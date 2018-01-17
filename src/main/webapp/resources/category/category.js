var category = angular.module("Category", []);
category.controller("categoryCtrl", function($scope, $http) {
	/* 전역 변수 선언 및 초기값 설정 */
	$scope.viewRow = 9;
	$scope.pageNum = 1;
	$scope.selectOrder = "-hit";
	$scope.menuData = [];    /* 콤보박스 리스트 데이터 변수 선언 */
	$scope.typeCheck = true; /* 콤보박스 보여줄지 설정 하는 변수 */
	$scope.type = location.pathname.substring(1, location.pathname.length); /* 카테고리 타입명 변수 담기 */
	
	/* 카테고리별 변경 내용 설정 부분 */
	if($scope.type == "category") {
		$scope.bannerUrl = "resources/img/banner.jpg";
		$scope.title = "카테고리";
		$scope.typeCheck = false;
	} else if($scope.type == "living") {
		$scope.bannerUrl = "resources/img/banner.jpg";
		$scope.title = "리빙";
		$scope.menuData = [
			{type: 11, name:"손거울"},{type: 12, name:"손난로"}
		];
	} else if($scope.type == "figure") {
		$scope.bannerUrl = "resources/img/banner.jpg";
		$scope.title = "피규어";
		$scope.menuData = [
			{type: 21, name:"피규어"}
		];
	} else if($scope.type == "accesory") {
		$scope.bannerUrl = "resources/img/banner.jpg";
		$scope.title = "악세사리";
		$scope.menuData = [
			{type: 31, name:"팔찌"},{type: 32, name:"키링"},{type: 33, name:"에코백"}
		];
	} else if($scope.type == "etc") {
		$scope.bannerUrl = "resources/img/banner.jpg";
		$scope.title = "기타";
		$scope.menuData = [
			{type: 51, name:"기타"}
		];
	} else if($scope.type == "clothes") {
		$scope.bannerUrl = "resources/img/banner.jpg";
		$scope.title = "의류";
		$scope.menuData = [
			{type: 41, name:"의류"}
		];
	}
	
	/* 콤보박스 선택 값 설정 부분 */
	$scope.menuEvent = function(row){
		$scope.selectType = {type: row.type};
	}
	
	/* categorylist URL 실행 되는 부분 */
	$scope.init = function() {
	    /* 비동기식 (자바 @RequestMapping) 호출 하고 리턴 받는 부분 : param (시작 번호, 보여줄 갯수) */
    	$http.post("categorylist","", {params: {type: $scope.type}}).then(function(result){
    		$scope.data = result.data.categorylist;        /* 상품1 리스트에 적용할 전체 데이터 생성 */
            $scope.totCnt = $scope.data.length;            /* 상품1 리스트의 총 갯수 데이터 생성 */
            $scope.page = $scope.totCnt / $scope.viewRow;  /* 상품1 리스트의 페이징 될 갯수 데이터 생성 */
    		$scope.returnFnc();
    	});
    }
	
	/* categorylist URL 실행 후 처리하는 부분 */
	$scope.returnFnc = function() {
		$scope.hash = location.hash;     /* a 태그의 이벤트로 발생한 hash 값을 가져온다. */
	    if($scope.hash != ""){           /* hash 값이 있을 경우 page 변수의 값으로 사용한다. */
	    	$scope.pageNum = $scope.hash.substr(1, $scope.hash.length);
	    } else {                         /* hash 값이 없을 경우 page 변수의 값은 1로 처리한다. */
	    	$scope.pageNum = 1;
	    }
	    $scope.end = ($scope.viewRow * $scope.pageNum); /* 리스트에 보여줄 끝 번호 생성 */
	    $scope.start = ($scope.end - $scope.viewRow);   /* 리스트에 보여줄 시작 번호 생성 */

        $scope.pageArry = [];                           /* 페이징으로 보여 줄 리스트 데이터 생성  */
        for(var i = 0; i < $scope.page; i++){
        	$scope.pageArry.push({no : i});
        }
	}
	
	/* 보러가기 선택시 처리하는 부분 */
	$scope.more = function(row){
		$scope.dNo=	row.gno;
			console.log(row);
			location.href = "detail?dNo=" + $scope.dNo;
	}		
	
	
	/* 페이징 번호 선택시 처리하는 부분 */
	$scope.pagingEvent = function(index){
		location.href = "#" + (index + 1);
		$scope.returnFnc();
	}
    
	/* categorylist 호출 부분 */
    $scope.init();
});