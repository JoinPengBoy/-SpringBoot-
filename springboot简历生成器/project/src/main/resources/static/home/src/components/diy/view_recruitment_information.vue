<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
		<el-row class="row_ce">
							<el-col v-if="$check_field('get','recruitment_title') || $check_field('add','recruitment_title') || $check_field('set','recruitment_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="招聘标题" prop="recruitment_title">
												<el-input id="recruitment_title" v-model="form['recruitment_title']" placeholder="请输入招聘标题"
							  v-if="(form['recruitment_information_id'] && $check_field('set','recruitment_title')) || (!form['recruitment_information_id'] && $check_field('add','recruitment_title'))" :disabled="disabledObj['recruitment_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','recruitment_title')">{{form['recruitment_title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','enterprise_name') || $check_field('add','enterprise_name') || $check_field('set','enterprise_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="企业名称" prop="enterprise_name">
												<el-input id="enterprise_name" v-model="form['enterprise_name']" placeholder="请输入企业名称"
							  v-if="(form['recruitment_information_id'] && $check_field('set','enterprise_name')) || (!form['recruitment_information_id'] && $check_field('add','enterprise_name'))" :disabled="disabledObj['enterprise_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','enterprise_name')">{{form['enterprise_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','enterprise_users') || $check_field('add','enterprise_users') || $check_field('set','enterprise_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="企业用户" prop="enterprise_users">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_enterprise_users(form['enterprise_users']) }}
							<el-select v-if="(form['recruitment_information_id'] && $check_field('set','enterprise_users')) || (!form['recruitment_information_id'] && $check_field('add','enterprise_users'))" id="enterprise_users" v-model="form['enterprise_users']" :disabled="disabledObj['enterprise_users_isDisabled']">
								<el-option v-for="o in list_user_enterprise_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','enterprise_users')" id="enterprise_users" v-model="form['enterprise_users']" :disabled="true">
								<el-option v-for="o in list_user_enterprise_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="enterprise_users" v-model="form['enterprise_users']" :disabled="disabledObj['enterprise_users_isDisabled']">
							<el-option v-for="o in list_user_enterprise_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','registered_capital') || $check_field('add','registered_capital') || $check_field('set','registered_capital')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="注册资本" prop="registered_capital">
												<el-input id="registered_capital" v-model="form['registered_capital']" placeholder="请输入注册资本"
							  v-if="(form['recruitment_information_id'] && $check_field('set','registered_capital')) || (!form['recruitment_information_id'] && $check_field('add','registered_capital'))" :disabled="disabledObj['registered_capital_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','registered_capital')">{{form['registered_capital']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','job_type') || $check_field('add','job_type') || $check_field('set','job_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="岗位类型" prop="job_type">
								<el-select id="job_type" v-model="form['job_type']"						v-if="(form['recruitment_information_id'] && $check_field('set','job_type')) || (!form['recruitment_information_id'] && $check_field('add','job_type'))">
						<el-option v-for="o in list_job_type" :key="o['job_type']" :label="o['job_type']"
							:value="o['job_type']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','job_type')">{{form['job_type']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','cover_photo') || $check_field('add','cover_photo') || $check_field('set','cover_photo')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="封面图片" prop="cover_photo">
								<el-upload :disabled="disabledObj['cover_photo_isDisabled']" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_cover_photo"
						:show-file-list="false" v-if="(form['recruitment_information_id'] && $check_field('set','cover_photo')) || (!form['recruitment_information_id'] && $check_field('add','cover_photo'))">
						<img id="cover_photo" v-if="form['cover_photo']" :src="$fullUrl(form['cover_photo'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','cover_photo')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['cover_photo'])" :preview-src-list="[$fullUrl(form['cover_photo'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','salary_amount') || $check_field('add','salary_amount') || $check_field('set','salary_amount')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="薪资金额" prop="salary_amount">
												<el-input id="salary_amount" v-model="form['salary_amount']" placeholder="请输入薪资金额"
							  v-if="(form['recruitment_information_id'] && $check_field('set','salary_amount')) || (!form['recruitment_information_id'] && $check_field('add','salary_amount'))" :disabled="disabledObj['salary_amount_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','salary_amount')">{{form['salary_amount']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','professional_requirements') || $check_field('add','professional_requirements') || $check_field('set','professional_requirements')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="需求专业" prop="professional_requirements">
												<el-input id="professional_requirements" v-model="form['professional_requirements']" placeholder="请输入需求专业"
							  v-if="(form['recruitment_information_id'] && $check_field('set','professional_requirements')) || (!form['recruitment_information_id'] && $check_field('add','professional_requirements'))" :disabled="disabledObj['professional_requirements_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','professional_requirements')">{{form['professional_requirements']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','work_location') || $check_field('add','work_location') || $check_field('set','work_location')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="工作地点" prop="work_location">
												<el-input id="work_location" v-model="form['work_location']" placeholder="请输入工作地点"
							  v-if="(form['recruitment_information_id'] && $check_field('set','work_location')) || (!form['recruitment_information_id'] && $check_field('add','work_location'))" :disabled="disabledObj['work_location_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','work_location')">{{form['work_location']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','recruitment_positions') || $check_field('add','recruitment_positions') || $check_field('set','recruitment_positions')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="招聘职位" prop="recruitment_positions">
												<el-input id="recruitment_positions" v-model="form['recruitment_positions']" placeholder="请输入招聘职位"
							  v-if="(form['recruitment_information_id'] && $check_field('set','recruitment_positions')) || (!form['recruitment_information_id'] && $check_field('add','recruitment_positions'))" :disabled="disabledObj['recruitment_positions_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','recruitment_positions')">{{form['recruitment_positions']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','recruitment_details') || $check_field('add','recruitment_details') || $check_field('set','recruitment_details')" :xs="24" :sm="24" :lg="24" class="el_form_editor_warp">
				<el-form-item label="招聘详情" prop="recruitment_details">
					<quill-editor v-model.number="form['recruitment_details']"
						v-if="(form['recruitment_information_id'] && $check_field('set','recruitment_details')) || (!form['recruitment_information_id'] && $check_field('add','recruitment_details')) ">
					</quill-editor>
					<div v-else-if="$check_field('get','recruitment_details')" v-html="form['recruitment_details']"></div>
				</el-form-item>
			</el-col>
						
	
	
		
		
						<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp" v-if="!form['source_user_id'] && 0 > 0">
			  <el-form-item label="投放简历限次">
				<el-input id="limit_times" v-model="form['resume_information_limit_times']" placeholder="投放简历限制次数，0为不限"
						  v-if="$check_option('/recruitment_information/view','can_limits')"
				></el-input>
				<div v-else-if="$check_action('/recruitment_information/view','get')" v-html="form['resume_information_limit_times']"></div>
			  </el-form-item>
			</el-col>
			
	
	
	
	</el-row>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item v-if="$check_action('/recruitment_information/view','set') || $check_action('/recruitment_information/view','add') || $check_option('/recruitment_information/table','examine')">
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
				<el-form-item v-else>
					<el-button @click="cancel()">返回</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "recruitment_information_id",
				url_add: "~/api/recruitment_information/add?",
				url_set: "~/api/recruitment_information/set?",
				url_get_obj: "~/api/recruitment_information/get_obj?",
				url_upload: "~/api/recruitment_information/upload?",

				query: {
					"recruitment_information_id": 0,
				},

				form: {
								"recruitment_title":  '', // 招聘标题
										"enterprise_name":  '', // 企业名称
										"enterprise_users": 0, // 企业用户
										"registered_capital":  '', // 注册资本
										"job_type":  '', // 岗位类型
										"cover_photo":  '', // 封面图片
										"salary_amount":  '', // 薪资金额
										"professional_requirements":  '', // 需求专业
										"work_location":  '', // 工作地点
										"recruitment_positions":  '', // 招聘职位
										"recruitment_details":  '', // 招聘详情
											"recruitment_information_id": 0, // ID
													"resume_information_limit_times": 0, // 投放简历限制次数
										},
				disabledObj:{
								"recruitment_title_isDisabled": false,
										"enterprise_name_isDisabled": false,
										"enterprise_users_isDisabled": false,
										"registered_capital_isDisabled": false,
										"job_type_isDisabled": false,
										"cover_photo_isDisabled": false,
										"salary_amount_isDisabled": false,
										"professional_requirements_isDisabled": false,
										"work_location_isDisabled": false,
										"recruitment_positions_isDisabled": false,
										"recruitment_details_isDisabled": false,
										},

	
				
				
					// 用户列表
				list_user_enterprise_users: [],
						// 用户组
				group_user_enterprise_users: "",
						
										// 岗位类型选项列表
				list_job_type: [""],
	
				
				
				
				
				
				
			
			}
		},
		methods: {

	
	
			
	
			
	
				/**
			 * 获取企业用户用户列表
			 */
			async get_list_user_enterprise_users() {
                var json = await this.$get("~/api/user/get_list?user_group=企业用户");
                if(json.result && json.result.list){
                    this.list_user_enterprise_users = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取企业用户用户组
			 */
			async get_group_user_enterprise_users() {
							this.form["enterprise_users"] = this.$store.state.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=企业用户");
				if(json.result && json.result.obj){
					this.group_user_enterprise_users = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_enterprise_users(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_enterprise_users.source_table+"/get_obj?"
				this.$get(url, user_id, function(res) {
					if (res.result && res.result.obj) {
						var arr = []
						for (let key in res.result.obj) {
							arr.push(key)
						}
						var arrForm = []
									for (let key in _this.form) {
							arrForm.push(key)
						}
												_this.form["enterprise_users"] = id
									_this.disabledObj['enterprise_users' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "enterprise_users") {
			                      _this.form[arrForm[j]] = res.result.obj[arr[i]]
			                      _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								  break;
								} else {
								  _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								}
							  }
							}
						  }
						}
					}
				});
			},
					get_user_enterprise_users(id){
				var obj = this.list_user_enterprise_users.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
				/**
			 * 获取岗位类型列表
			 */
			async get_list_job_type() {
				var json = await this.$get("~/api/job_type/get_list?");
				if(json.result && json.result.list){
					this.list_job_type = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
					
						/**
			 * 上传封面图片
			 * @param {Object} param 图片参数
			 */
			upload_cover_photo(param){
									this.uploadFile(param.file, "cover_photo");
								},
	
	
			
	
			
	
			
	
			
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
																if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
								this.form[key] = form[dbKey]
							}
							if(dbKey === "source_table"){
								this.form['source_table'] = form[dbKey];
							}
							if(dbKey === "source_id"){
								this.form['source_id'] = form[dbKey];
							}
							if(dbKey === "source_user_id"){
								this.form['source_user_id'] = form[dbKey];
							}
						})
					})
				}
																										$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){

																																																							

			},

																																																																																			async submit(param, func){
				if (!param) {
					param = this.form;
				}
								var pm = this.events("submit_before", Object.assign({}, param)) || param;
				var msg = await this.events("submit_check", pm);
				var ret;
				if (msg) {
					this.$toast(msg, 'danger');
				} else {
																																																																																					ret = this.events("submit_main", pm, func);
				}
				return ret;
			},
			/**
			 * 提交前验证事件
			 * @param {Object} 请求参数
			 * @return {String} 验证成功返回null, 失败返回错误提示
			 */
						submit_check(param) {
																																																																																																																																			return null;
			},

			is_view(){
				// var bl = this.user_group == "管理员";
				var bl = false;

				if(!bl){
					bl = this.$check_action('/recruitment_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/recruitment_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/recruitment_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/recruitment_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/recruitment_information/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
									this.get_list_user_enterprise_users();
					this.get_group_user_enterprise_users();
									this.get_list_job_type();
																},
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}
	
	.img_multiple{
		overflow: hidden;
	}
	.img_multiple .img_block{
		float: left;
		margin-right: 5px;
		margin-bottom: 5px;
		position: relative;
	}
	.img_multiple .img_block img{
		height: 100px;
		width: auto;
	}
	.img_multiple .img_del{
		position: absolute;
		top: 5px;
		right: 5px;
		width: 20px;
		height: 20px;
		background: #0000008a;
		color: #fff;
		line-height: 20px;
		text-align: center;
		border-radius: 100%;
		cursor: pointer;
	}




</style>
