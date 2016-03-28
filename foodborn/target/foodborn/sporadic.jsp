<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>食源性疾病关联性分析系统</title>
	<link href="_assets/_css/main.css" rel="stylesheet" type="text/css" />
    <link href="_assets/_css/style.css" rel="stylesheet" type="text/css"/>
    <%--<script type="text/javascript" src="/foodborn/js/jquery-1.3.2.min.js"></script>--%>
    <%--<script type="text/javascript" src="/foodborn/js/UploadFile.js"></script>--%>
	<script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="/js/UploadFile.js"></script>
</head>
<body>
	<div id="top">
		<div class="wrapper shapes"></div>
	</div>
	<div id="nav">
		<div id="logowapper">
			<div id="logo"></div>
		</div>
		<div class="wrapper">
			<ul class="navigation">
				<li><a href="home.jsp">首页</a></li>
				<li><a href="aggregation.jsp">聚集性爆发分析</a></li>
				<li class="selected"><a href="sporadic.jsp">散发性爆发分析</a></li>
				<li><a href="about.jsp">系统设置</a></li>
				<li><a href="blog.jsp">使用指南</a></li>
			</ul>
		</div>
	</div>
	<div id="main">
		<div class="shapes">
			<div class="wrapper">
				<div id="info">
					欢迎使用食源性疾病关联性分析系统！您正在使用<span class="blue">散发性爆发分析</span>。
				</div>
				<div id="homeServices">
					<div class="col">
						<div class="box">
							<div class="hosting"></div>
							<div class="content">
								<h1><span class="blue">数据处理</span></h1>
								<span class="orange">导入数据:</span>
								<div class="upload_box_step1">
									<form  id="sporadic_upload_form_step1" action="sporadic_upload_step1.do" method="post" enctype="multipart/form-data" target="sporadic_upload_iframe_step1">
										<input type='text' name='finame="sporadic_upload_form_step1"letxt' class='txt filetxt' id='filetxt_step1' />
										<input type='button' class='button white browse' value='浏 览' onclick="sporadic_file_step1.click()" /> 
										<input type="file" name="sporadic_file_step1" id="sporadic_file_step1" onchange="document.getElementById('filetxt_step1').value=this.value" style="display: none"> 
										<input type="button"  class="button white submit" onclick="uploadStep1()" value="开始处理" />
									</form>
									<iframe id="sporadic_upload_iframe_step1" name="sporadic_upload_iframe_step1" ></iframe>
								</div>
								<div class="progress_box" id="progress_box_step1">
									<div class="progress" id="progress_step1">
										<span class="blue" id="progress_img_step1" style="width: 0%;">
											<span id="progress_txt_step1">0%</span>
										</span>
									</div>
								</div>
								<div class="description">
									<span> 
										说明：<br /> 
										该过程对数据进行了<br /> 
										1.去重补缺，症状分词<br />
										2.加入食物信息<br /> 
										3.给症状词打上S:标签，给食物打上F:标签<br />
									</span>
								</div>
							</div>
							<div class="footer"></div>
						</div>
					</div>
					<div class="col">
						<div class="box">
							<div class="servers"></div>
							<div class="content">
								<h1><span class="blue">数据分析</span></h1>
								<span class="orange">导入分析文件:</span><br />
								<div class="upload_box_step2">
									<form id="sporadic_upload_form_step2" action="sporadic_upload_step2.do" method="post" enctype="multipart/form-data" target="sporadic_upload_iframe_step2">
										<div class="importpre_box">
											<span class="orange">直接导入预处理文件？
												<input type="checkbox" class="checkbox" name = "step2_checkbox" id = "step2_checkbox" value = "check" onchange="todisablebtn()"/>
												<input type="hidden" name="step2_checkbox"/>
											</span>
										</div>
										<div class="uploadfile_box">
											<input type='text' name='filetxt' class='txt filetxt' id='filetxt_step2' /> 
											<input type='button' class='button white browse' id = 'browbtn' value='浏 览' onclick="sporadic_file_step2.click()" />
											<input type="file" name = "sporadic_file_step2" id="sporadic_file_step2" onchange="document.getElementById('filetxt_step2').value=this.value" style="display: none">
										</div>
										<div class="clusters_num_box">
											<span class="orange">聚类数目：
												<input type="text" class="txt clusters_num" id="cluster_num_step2" value="3" />
											</span>
										</div>
										<div class="support_num_box">
											<span class="orange">支持度设定：
												<input type="text" class="txt support_num" id="support_num_step2" name = "support_txt_val" value="30" />
											</span>
										</div>
										<input type="submit" class="button white submit" onclick="uploadStep2()" value="开始分析" />
									</form>
									<iframe id="sporadic_upload_iframe_step2" name="sporadic_upload_iframe_step2" style="display: none"></iframe>
								</div>
								<div class="progress_box" id="progress_box_step2">
									<div class="progress" id="progress_step2">
										<span class="blue" id="progress_img_step2" style="width: 80%;">
											<span id="progress_txt_step2">80%</span>
										</span>
									</div>
								</div>
								<div class="description">
									<span> 
										说明：<br />
										该过程为散发性爆发监测算法，对输入文件中的对象进行归类，输出每个对象的类标号。
									</span>
								</div>
							</div>
							<div class="footer"></div>
						</div>
					</div>
					<div class="col last">
						<div class="box">
							<div class="services"></div>
							<div class="content">
								<h1><span class="blue">结果展示</span></h1>
								<span class="orange">请选择要关联分析的属性:</span><br />
								<div class="upload_box_step3">
									<form action="sporadic_upload_step3.shtml" method="post" enctype="multipart/form-data">
										<div class="checkbox_box">
											<span class="orange"><input type="checkbox" name="checkbox_item_all" class="checkbox_item_col1" />全部属性</span><br />
											<span class="orange"><input type="checkbox" name="checkbox_item" class="checkbox_item_col1" />感染菌种</span>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span class="orange"><input type="checkbox" name="checkbox_item" class="checkbox_item_col2" />职业</span><br />
											<span class="orange"><input type="checkbox" name="checkbox_item" class="checkbox_item_col1" />病人地址</span>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span class="orange"><input type="checkbox" name="checkbox_item" class="checkbox_item_col2" />发病时间</span><br />
											<span class="orange"><input type="checkbox" name="checkbox_item" class="checkbox_item_col1" />购买地点</span>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span class="orange"><input type="checkbox" name="checkbox_item" class="checkbox_item_col2" />食品商标</span><br />
											<span class="orange"><input type="checkbox" name="checkbox_item" class="checkbox_item_col1" />食用地点</span>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span class="orange"><input type="checkbox" name="checkbox_item" class="checkbox_item_col2" />食用时间</span><br />
										</div>
										<input type="submit" name="submit" class="button white showresult" value="结果展示" />
									</form>
									<input type="button" name="exportresult" class="button white exportresult" value="导出结果文件" />
								</div>
								<div class="description">
									<span> 
										说明：<br /> 
										该过程实现了对食品信息的关联。
									</span>
								</div>
							</div>
							<div class="footer"></div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div id="testimonials">
		<div class="wrapper">
			<h1>show result</h1>
			<div class="clear"></div>
			<div class="homeTestimonials"></div>
		</div>
	</div>
	<div id="copyright">
		<div class="wrapper">
			&copy; Copyright &copy; <br /> 
			2016.Computer Network Information Center,Chinese Academy of Science All rights reserved. <a target="_blank" href="http://www.cnic.cn">中国科学院计算机网络信息中心</a>
		</div>
	</div>
</body>
</html>