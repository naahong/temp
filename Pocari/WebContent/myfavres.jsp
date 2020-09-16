<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>오늘 뭐먹지? 맛집등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="headerstyle.css" />
<link rel="stylesheet" type="text/css" href="footerstyle.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style>
    *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: 나눔고딕;
     }
     #wrap{
        width: 100%;
     }
     #contents-wrap{
        width: 100%;
        display: flex;
        justify-content: space-around;
     }
     .asnse{
        width: 1366px;
        display: flex;
        justify-content: space-around;
     }
     aside{
        width: 25%;
        padding-top: 230px;
        border-left: 1px solid #a1c181;
     }
     aside li{
         list-style:none;
         margin: 20px;
         padding: 10px;
         font-size: 16px;
         font-weight: bolder;
     }
     aside li:hover{
        background-color: #a1c181;
    }
    section{
        width: 75%;
    }
    .details{
        width: 100%;
        padding-top: 170px;
        padding-bottom: 50px;
    }
    .details table{
        width: 100%;
        border-collapse: collapse;
    }
    .details table tr{
        height: 45px;
        border-left: 1px solid #233d4d;
        border-right: 1px solid #233d4d;
    }
    .details table tr td{
        padding: 10px 20px;
    }
    span{
        color: red;
    }
    #sido1, #gugun1{
        margin-left: 20px;
        margin-right: 20px;
    }
    input[type="text"]{
        height: 38px;
        border-radius: 5px;
        border: 1px solid #233d4d;
    }
    textarea{
        border: 1px dotted #233d4d;
    }
    .totalrating{
        padding: 20px;
        margin: 20px;
        border-bottom: 1px solid #fe7f2d;
    }
    select{
        width: 100px;
        height: 30px;
        margin-left: 50px;
        margin-right: 50px;
    }
    input[type="button"]{
        width: 50px;
        height: 25px;
        margin: 15px 20px;
        border: 2px solid #233d4d;
        background-color: #233d4d;
        color: white;
        font-size: 15px;
        font-weight: bold;
    }
    input[type="file"]{
        margin: 10px 5px;
    }
    #filearea{
        width: 80%;
        margin: 20px;
        padding: 20px;
        border: 1px solid #233d4d;
        display: flex;
        flex-flow: row wrap;
    }
    .anr{
    	width: 100%;
    	display: flex;
    }
    button, input[type="submit"]{
        width: 100px;
        height: 40px;
        border: 2px solid #233d4d;
        background-color: #fff;
        margin: 15px;
        border-radius: 15px;
    }
    
    @media (max-width: 768px) {
        .asnse{
            width: 100%;
            display: inline-block;
        }
        aside{
            border: 0;
            width: 100%;
            padding-top: 150px;
        }
        aside ul{
            display: flex;
        }
        aside li{
            margin: 10px;
            border: 0;
            font-size: 13px;
        }
        section{
            width: 100%;
        }
        table{
            font-size: 14px;
        }
        .details{
            padding-top: 80px;
        }
    }
    
</style>
</head>
<body>
<div id="wrap">
   <header><jsp:include page="header.jsp"/></header>
   <div id="contents-wrap">
      <div class="asnse">
          <aside>
             <ul>
                <li onclick="location.href='eatout.do'">맛집 찾기</li>
                <li onclick="location.herf='recipeMain.do'">레시피 찾기</li>
             </ul>
          </aside>
          <section>
          <div class="details">
          	  <form action="inputres.do" method="post" enctype = "multipart/form-data">
              <table cellspacing="10px">
                 <colgroup>
                     <col width="30%"><col width="20%"><col width="25%"><col width="25%">
                 </colgroup>
                  <tr style="height: 80px; border-top: 1px solid #233d4d; background-color: #233d4d">
                      <td colspan="4" style="font-size: 17px; font-weight: bolder; color: white">내 맛집 등록하기 <i class="far fa-smile"></i></td>
                  </tr>
                  <tr>
                      <td colspan="4" style="text-align: right"><p style="font-size: 13px"><span>*</span>항목은 필수입니다.</p></td>
                  </tr>
                  <tr>
                      <td><span>*</span>상호명</td>
                      <td colspan="3"><input type="text" name="storename" style="width: 70%"></td>
                  </tr>
                  <tr>
                      <td><span>*</span>지역</td>
                      <td><select name="sido1" id="sido1"></select><select name="gugun2" id="gugun1"></select></td>
                      <td colspan="2"><span>*</span>카테고리<select name="category" style="width: 150px"><option value="">카테고리선택</option><option value="한식">한식</option>
                      <option value="양식">양식</option><option value="중식">중식</option><option value="일식">일식</option>
                      <option value="카페">카페</option><option value="베이커리/디저트">베이커리/디저트</option>
                      <option value="채식">채식</option><option value="기타">기타</option></select></td>
                  </tr>
                  <tr>
                      <td>연락처 정보</td>
                      <td colspan="3"><input type="text" name="tel" style="width:400px" placeholder="xxx-xxxx-xxxx 형식으로 입력해주세요"></td>
                  </tr>
                  <tr>
                      <td style="text-align: right">대표 사진<br>올리기</td>
                      <td colspan="3"><input type="file" name="m_imgpath"></td>
                  </tr>
                  <tr>
                      <td colspan="4">태그<br><br><input type="text" name="s_tag" style="width: 90%" placeholder="예시 : 모임장소, 주차장넓음, 월요일 휴무 등..."><br><br></td>
                  </tr>
                  <tr style="height: 80px; background-color: #233d4d">
                      <td colspan="4" style="font-size: 17px; font-weight: bolder; color: white">리뷰쓰기 <i class="far fa-smile"></i></td>
                  </tr>
                  <tr>
                      <td colspan="4" style="text-align: right"><p style="font-size: 13px"><span>*</span>항목은 필수입니다.</p></td>
                  </tr>
                  <tr>
                      <td style="text-align: right"><span>*</span>리뷰</td>
                      <td colspan="3"><textarea rows=10 cols=120 name="comment"></textarea></td>
                  </tr>
                  <tr>
                      <td colspan="4" style="text-align: center">
                        <div class="totalrating">
                          <span>*</span>전체평점<select name="total"><option value="">점수</option><option value="5">5</option>
                          <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                          <option value="1">1</option></select>
                        </div> 
                      </td>
                  </tr>
                  <tr>
                      <td colspan="4" style="text-align: center">
                          분위기<select name="atmosphere"><option value="">점수</option><option value="5">5</option>
                          <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                          <option value="1">1</option></select>
                          서비스<select name="service"><option value="">점수</option><option value="5">5</option>
                          <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                          <option value="1">1</option></select>
                          청결도<select name="sanitary"><option value="">점수</option><option value="5">5</option>
                          <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                          <option value="1">1</option></select>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="4" style="text-align: center">
                          맛<select name="flavor"><option value="">점수</option><option value="5">5</option>
                          <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                          <option value="1">1</option></select>
                          양<select name="portions"><option value="">점수</option><option value="5">5</option>
                          <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                          <option value="1">1</option></select>
                          가격<select name="price"><option value="">점수</option><option value="5">5</option>
                          <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                          <option value="1">1</option></select>
                      </td>
                  </tr>
                  <tr>
                      <td style="text-align: right">후기 사진<br>올리기</td>
                      <td colspan="3">
                          <div id="filearea">
                              <input type="file" name="r_img1">
                          </div>
                          <div class="anr">최대 6장까지 가능합니다.<input type="button" value="+" id="add"><input type="button" value="-" id="remove"></div>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="4">태그<br><br><input type="text" name="r_tag" style="width: 90%"  placeholder="예시 : 매워요, 동네맛집, 수요일 휴무 등..."></td>
                  </tr>
                   <tr style="border-bottom: 1px solid #233d4d">
                      <td colspan="4" style="text-align: center">
                          <button onclick=location.href="eatout.do">취소</button>
                          <input type="submit" value="등록하기" onclick="sign()"> 
                      </td>
                  </tr>
              </table>
              </form>
          </div>
          </section>
       </div>
   </div>
   <footer><jsp:include page="footer.jsp"/></footer>
</div>      


<script>
    $(document).ready(function(){
        
          var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
          var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
           var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
           var area3 = ["대덕구","동구","서구","유성구","중구"];
           var area4 = ["광산구","남구","동구","북구","서구"];
           var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
           var area6 = ["남구","동구","북구","중구","울주군"];
           var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
           var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
           var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
           var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
           var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
           var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
           var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
           var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
           var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
           var area16 = ["서귀포시","제주시","남제주군","북제주군"];



         // 시/도 선택 박스 초기화

         $("select[name^=sido]").each(function() {
          $selsido = $(this);
          $.each(eval(area0), function() {
           $selsido.append("<option value='"+this+"'>"+this+"</option>");
          });
          $selsido.next().append("<option value=''>구/군 선택</option>");
         });



         // 시/도 선택시 구/군 설정

         $("select[name^=sido]").change(function() {
          var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
          var $gugun = $(this).next(); // 선택영역 군구 객체
          $("option",$gugun).remove(); // 구군 초기화

          if(area == "area0")
           $gugun.append("<option value=''>구/군 선택</option>");
          else {
           $.each(eval(area), function() {
            $gugun.append("<option value='"+this+"'>"+this+"</option>");
           });
          }
         });
        
        
    });
    
/* ================================================================= */    
    
    //var form = document.forms[0];
	var add = document.getElementById("add");
	var remove = document.getElementById("remove");
	var filearea = document.getElementById("filearea");
	var cnt = 1;
		
	add.onclick = function(){
		if(cnt<6){
			cnt++;
			var elm = document.createElement("input");
			elm.type = "file";
			elm.name = "r_img"+cnt;
			
			filearea.appendChild(elm);
		}
	};
	
	remove.onclick = function(){
		if(cnt>1){
			cnt--;
			var inputs = filearea.getElementsByTagName("input");
			filearea.removeChild(inputs[cnt]);
		}
	};
	
	function sign(){
		
	}
    
</script>

</body>
</html>