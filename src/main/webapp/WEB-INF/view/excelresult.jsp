<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>导表选择</title>
<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstray.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<body>
<a href="${pageContext.request.contextPath}/tuibiao.do?name=develop">更新develop数据库</a>
        <c:forEach items="${datas}" var="resource">
        导入${resource.resource}:<br>
            <c:forEach items="${resource.list}" var="table">
                   <c:if test="${table.isException == 1}" >
                       导入${table.tableName}表失败!<a onclick="showerror(${table.exception})">错误信息</a><br>
                   </c:if>
                   <c:if test="${table.isException == 0}" >
                       导入${table.tableName}表成功!&nbsp插入${table.insertNum}条!&nbsp更新${table.updateNum}条!&nbsp<br>
                   </c:if>
                   <c:if test="${table.isException == 0}" >
	                   <c:forEach items="${table.uselessField}" var="uselessField">
	                       <font size="6">${uselessField}列没有找到</font>
	                   </c:forEach>
	            
		               <table border=1 cellspacing=0 width=100% bordercolorlight=#333333 bordercolordark=#efefef>
		                   <tr bgcolor=#cccccc>
		                       <th title="黑色U代表更新,绿色I代表插入,红色D代表删除">操作</th>
		                       <c:forEach items="${table.title}" var="title">
		                           <th>&nbsp&nbsp${title}&nbsp&nbsp</th>
		                       </c:forEach>
		                   </tr>
	                       <c:forEach items="${table.changeLines}" var="changeLine">
		                      <tr>
	                               <c:if test="${changeLine.state == 0}" >
	                                      <td align="center"><font color="red">D</font></td>
	                               </c:if>
	                               <c:if test="${changeLine.state == 1}" >
	                                      <td align="center">U</td>
	                               </c:if>
	                               <c:if test="${changeLine.state == 2}" >
	                                      <td align="center"><font color="greed">I</font></td>
	                               </c:if>
	                               <c:forEach items="${changeLine.changeRecords}" var="record">
	                                   <c:if test="${record.isChange == 1}" >
	                                       <td align="center" title="${record.oldValue}"><font color="red">${record.value}</font></td>
	                                   </c:if>
	                                   <c:if test="${record.isChange == 0}" >
	                                       <td align="center">${record.value}</td>
	                                   </c:if>
	                               </c:forEach>
	                           </tr>
	                       </c:forEach>
		               </table>
                   </c:if>
            </c:forEach>
        </c:forEach>
</body>
<script type="text/javascript">
function showerror(error){
    alert(error);
}
</script>
</html>