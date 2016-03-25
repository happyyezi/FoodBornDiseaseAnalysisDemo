<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>食源性疾病关联性分析系统</title>
	<link href="_assets/_css/main.css" rel="stylesheet" type="text/css" />
    <link href="_assets/_css/style.css" rel="stylesheet" type="text/css"/>
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
				<li class="selected"><a href="aggregation.jsp">聚集性爆发分析</a></li>
				<li><a href="sporadic.jsp">散发性爆发分析</a></li>
				<li><a href="about.jsp">系统设置</a></li>
				<li><a href="blog.jsp">使用指南</a></li>
			</ul>
		</div>
	</div>
	<div id="main">
		<div class="shapes">
			<div class="wrapper">
				<div id="info">
					欢迎使用食源性疾病关联性分析系统！您正在使用<span class="blue">聚集性爆发分析</span>。
				</div>
				<div id="homeServices">
					<div class="col">
						<div class="box">
							<div class="hosting"></div>
							<div class="content">
								<h1><span class="blue">数据处理</span></h1>
								<span class="orange">导入数据:</span>
								<div class="upload_box_step1">
									<form action="aggregation_upload_step1.shtml" method="post" enctype="multipart/form-data">
										<input type='text' name='filetxt' class='txt filetxt' id='filetxt_step1' /> 
										<input type='button' class='button white browse' value='浏 览' onclick="aggregation_file_step1.click()" /> 
										<input type="file" id="aggregation_file_step1" onchange="document.getElementById('filetxt_step1').value=this.value" style="display: none"> 
										<input type="submit" name="submit" class="button white submit" value="开始处理" />
									</form>
								</div>
								<div class="progress_box" id="progress_box_step1">
									<div class="progress" id="progress_step1">
										<span class="blue" id="progress_img_step1" style="width: 50%;">
											<span id="progress_txt_step1">50%</span>
										</span>
									</div>
								</div>
								<div class="description">
									<span> 
										说明：<br /> 
										该过程对数据进行了<br /> 
										1.去重补缺，症状分词<br />
										2.日期整型转换<br /> 
										3.地址编码<br />
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
									<form action="aggregation_upload_step2.shtml" method="post" enctype="multipart/form-data">
										<div class="importpre_box">
											<span class="orange">直接导入预处理文件？<input type="checkbox"
												class="checkbox" /></span>
										</div>
										<div class="uploadfile_box">
											<input type='text' name='filetxt' class='txt filetxt' id='filetxt_step2' /> 
											<input type='button' class='button white browse' value='浏 览' onclick="aggregation_file_step2.click()" /> 
											<input type="file" id="aggregation_file_step2" onchange="document.getElementById('textfield_step2').value=this.value" style="display: none">
										</div>
										<div class="combo_box">
											<span class="orange">请选择待分析省份：</span> <select>
												<option value="北京">&nbsp;&nbsp;&nbsp;&nbsp;北&nbsp;&nbsp;&nbsp;&nbsp;京</option>
												<option value="天津">&nbsp;&nbsp;&nbsp;&nbsp;天&nbsp;&nbsp;&nbsp;&nbsp;津</option>
												<option value="重庆">&nbsp;&nbsp;&nbsp;&nbsp;重&nbsp;&nbsp;&nbsp;&nbsp;庆</option>
												<option value="上海">&nbsp;&nbsp;&nbsp;&nbsp;上&nbsp;&nbsp;&nbsp;&nbsp;海</option>
												<option value="河北">&nbsp;&nbsp;&nbsp;&nbsp;河&nbsp;&nbsp;&nbsp;&nbsp;北</option>

												<option value="山西">&nbsp;&nbsp;&nbsp;&nbsp;山&nbsp;&nbsp;&nbsp;&nbsp;西</option>
												<option value="辽宁">&nbsp;&nbsp;&nbsp;&nbsp;辽&nbsp;&nbsp;&nbsp;&nbsp;宁</option>
												<option value="吉林">&nbsp;&nbsp;&nbsp;&nbsp;吉&nbsp;&nbsp;&nbsp;&nbsp;林</option>
												<option value="黑龙江">&nbsp;&nbsp;黑&nbsp;&nbsp;龙&nbsp;&nbsp;江</option>
												<option value="江苏">&nbsp;&nbsp;&nbsp;&nbsp;江&nbsp;&nbsp;&nbsp;&nbsp;苏</option>

												<option value="浙江">&nbsp;&nbsp;&nbsp;&nbsp;浙&nbsp;&nbsp;&nbsp;&nbsp;江</option>
												<option value="安徽">&nbsp;&nbsp;&nbsp;&nbsp;安&nbsp;&nbsp;&nbsp;&nbsp;徽</option>
												<option value="福建">&nbsp;&nbsp;&nbsp;&nbsp;福&nbsp;&nbsp;&nbsp;&nbsp;建</option>
												<option value="江西">&nbsp;&nbsp;&nbsp;&nbsp;江&nbsp;&nbsp;&nbsp;&nbsp;西</option>
												<option value="山东">&nbsp;&nbsp;&nbsp;&nbsp;山&nbsp;&nbsp;&nbsp;&nbsp;东</option>

												<option value="河南">&nbsp;&nbsp;&nbsp;&nbsp;河&nbsp;&nbsp;&nbsp;&nbsp;南</option>
												<option value="湖北">&nbsp;&nbsp;&nbsp;&nbsp;湖&nbsp;&nbsp;&nbsp;&nbsp;北</option>
												<option value="湖南">&nbsp;&nbsp;&nbsp;&nbsp;湖&nbsp;&nbsp;&nbsp;&nbsp;南</option>
												<option value="广东">&nbsp;&nbsp;&nbsp;&nbsp;广&nbsp;&nbsp;&nbsp;&nbsp;东</option>
												<option value="海南">&nbsp;&nbsp;&nbsp;&nbsp;海&nbsp;&nbsp;&nbsp;&nbsp;南</option>

												<option value="四川">&nbsp;&nbsp;&nbsp;&nbsp;四&nbsp;&nbsp;&nbsp;&nbsp;川</option>
												<option value="贵州">&nbsp;&nbsp;&nbsp;&nbsp;贵&nbsp;&nbsp;&nbsp;&nbsp;州</option>
												<option value="云南">&nbsp;&nbsp;&nbsp;&nbsp;云&nbsp;&nbsp;&nbsp;&nbsp;南</option>
												<option value="陕西">&nbsp;&nbsp;&nbsp;&nbsp;陕&nbsp;&nbsp;&nbsp;&nbsp;西</option>
												<option value="甘肃">&nbsp;&nbsp;&nbsp;&nbsp;甘&nbsp;&nbsp;&nbsp;&nbsp;肃</option>

												<option value="青海">&nbsp;&nbsp;&nbsp;&nbsp;青&nbsp;&nbsp;&nbsp;&nbsp;海</option>
												<option value="台湾">&nbsp;&nbsp;&nbsp;&nbsp;台&nbsp;&nbsp;&nbsp;&nbsp;湾</option>
												<option value="内蒙古">&nbsp;&nbsp;内&nbsp;&nbsp;蒙&nbsp;&nbsp;古</option>
												<option value="广西">&nbsp;&nbsp;&nbsp;&nbsp;广&nbsp;&nbsp;&nbsp;&nbsp;西</option>
												<option value="西藏">&nbsp;&nbsp;&nbsp;&nbsp;西&nbsp;&nbsp;&nbsp;&nbsp;藏</option>

												<option value="宁夏">&nbsp;&nbsp;&nbsp;&nbsp;宁&nbsp;&nbsp;&nbsp;&nbsp;夏</option>
												<option value="新疆">&nbsp;&nbsp;&nbsp;&nbsp;新&nbsp;&nbsp;&nbsp;&nbsp;疆</option>
												<option value="香港">&nbsp;&nbsp;&nbsp;&nbsp;香&nbsp;&nbsp;&nbsp;&nbsp;港</option>
												<option value="澳门">&nbsp;&nbsp;&nbsp;&nbsp;澳&nbsp;&nbsp;&nbsp;&nbsp;门</option>
											</select>
										</div>
										<div class="case_num_box">
											<span class="orange">爆发最小病例数：
												<input type="text" class="txt case_num" id="case_num_step2" value="3" />
											</span>
										</div>
										<input type="submit" name="submit" class="button white submit" value="开始分析" />
									</form>
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
										该过程对选定省份的数据<br /> 
										1.抽取症状文本生成文本向量<br />
										2.合并时间、经纬度和文本向量，组成特征向量<br /> 
										3.进行ROI赋权<br /> 
										4.计算K近邻,发现聚集性病例<br />
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
									<form action="aggregation_upload_step3.shtml" method="post" enctype="multipart/form-data">
										<div class="checkbox_box">
											<span class="orange"><input type="checkbox" name="checkbox_item_all" class="checkbox_item_col1" />全部属性</span><br />
											<span class="orange"><input type="checkbox" name="checkbox_item" class="checkbox_item_col1" />病人地址</span>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span class="orange"><input type="checkbox" name="checkbox_item" class="checkbox_item_col2" />职业</span><br />
											<span class="orange"><input type="checkbox" name="checkbox_item" class="checkbox_item_col1" />发病时间</span>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span class="orange"><input type="checkbox" name="checkbox_item" class="checkbox_item_col2" />食物</span><br />
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
			&copy; Copyright &copy; <br /> 2016.Computer Network Information
			Center,Chinese Academy of Science All rights reserved. <a
				target="_blank" href="http://www.cnic.cn">中国科学院计算机网络信息中心</a>.
		</div>
	</div>
</body>
</html>