<template>
	<div class="diy_edit page_resume_information" id="resume_information_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row diy_edit_content_box'>
						<div v-if="$check_field('set','recruitment_title') || $check_field('add','recruitment_title') || $check_field('get','recruitment_title')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								招聘标题:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_recruitment_title" v-model="form['recruitment_title']" placeholder="请输入招聘标题" v-if="(form['recruitment_title'] && $check_field('set','recruitment_title')) || (!form['recruitment_title'] && $check_field('add','recruitment_title'))"  :disabled="disabledObj['recruitment_title_isDisabled']"/>
							<span v-else-if="$check_field('get','recruitment_title')">{{ form['recruitment_title'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','enterprise_name') || $check_field('add','enterprise_name') || $check_field('get','enterprise_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								企业名称:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_enterprise_name" v-model="form['enterprise_name']" placeholder="请输入企业名称" v-if="(form['enterprise_name'] && $check_field('set','enterprise_name')) || (!form['enterprise_name'] && $check_field('add','enterprise_name'))"  :disabled="disabledObj['enterprise_name_isDisabled']"/>
							<span v-else-if="$check_field('get','enterprise_name')">{{ form['enterprise_name'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','enterprise_users') || $check_field('add','enterprise_users') || $check_field('get','enterprise_users')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								企业用户:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_enterprise_users" :disabled="disabledObj['enterprise_users_isDisabled']" v-model="form['enterprise_users']" v-if="(form['enterprise_users'] && $check_field('set','enterprise_users')) || (!form['enterprise_users'] && $check_field('add','enterprise_users'))" >
								<option v-for="o in list_user_enterprise_users" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','enterprise_users')">{{ get_user_info("enterprise_users", form['enterprise_users']) }}</span>
						</div>
					</div>
							<div v-if="$check_field('set','job_type') || $check_field('add','job_type') || $check_field('get','job_type')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								岗位类型:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_job_type" v-model="form['job_type']" placeholder="请输入岗位类型" v-if="(form['job_type'] && $check_field('set','job_type')) || (!form['job_type'] && $check_field('add','job_type'))"  :disabled="disabledObj['job_type_isDisabled']"/>
							<span v-else-if="$check_field('get','job_type')">{{ form['job_type'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','target_users') || $check_field('add','target_users') || $check_field('get','target_users')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								投放用户:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_target_users" :disabled="disabledObj['target_users_isDisabled']" v-model="form['target_users']" v-if="(form['target_users'] && $check_field('set','target_users')) || (!form['target_users'] && $check_field('add','target_users'))" >
								<option v-for="o in list_user_target_users" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','target_users')">{{ get_user_info("target_users", form['target_users']) }}</span>
						</div>
					</div>
							<div v-if="$check_field('set','user_name') || $check_field('add','user_name') || $check_field('get','user_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								用户姓名:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_user_name" v-model="form['user_name']" placeholder="请输入用户姓名" v-if="(form['user_name'] && $check_field('set','user_name')) || (!form['user_name'] && $check_field('add','user_name'))"  :disabled="disabledObj['user_name_isDisabled']"/>
							<span v-else-if="$check_field('get','user_name')">{{ form['user_name'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','user_gender') || $check_field('add','user_gender') || $check_field('get','user_gender')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								用户性别:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_user_gender" v-model="form['user_gender']" placeholder="请输入用户性别" v-if="(form['user_gender'] && $check_field('set','user_gender')) || (!form['user_gender'] && $check_field('add','user_gender'))"  :disabled="disabledObj['user_gender_isDisabled']"/>
							<span v-else-if="$check_field('get','user_gender')">{{ form['user_gender'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','user_age') || $check_field('add','user_age') || $check_field('get','user_age')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								用户年龄:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_user_age" v-model="form['user_age']" placeholder="请输入用户年龄" v-if="(form['user_age'] && $check_field('set','user_age')) || (!form['user_age'] && $check_field('add','user_age'))"  :disabled="disabledObj['user_age_isDisabled']"/>
							<span v-else-if="$check_field('get','user_age')">{{ form['user_age'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','contact_information') || $check_field('add','contact_information') || $check_field('get','contact_information')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								联系方式:
							</span>
						</div>
								<!-- 手机 -->
						<div class="diy_field diy_phone">
							<input type="text" id="form_contact_information" v-model="form['contact_information']" placeholder="请输入联系方式" v-if="(form['contact_information'] && $check_field('set','contact_information')) || (!form['contact_information'] && $check_field('add','contact_information'))" :disabled="disabledObj['contact_information_isDisabled']" />
							<span v-else-if="$check_field('get','contact_information')">{{ form['contact_information'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','educational_background') || $check_field('add','educational_background') || $check_field('get','educational_background')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								教育背景:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_educational_background" v-model="form['educational_background']" placeholder="请输入教育背景" v-if="(form['educational_background'] && $check_field('set','educational_background')) || (!form['educational_background'] && $check_field('add','educational_background'))"  :disabled="disabledObj['educational_background_isDisabled']"/>
							<span v-else-if="$check_field('get','educational_background')">{{ form['educational_background'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','work_experience') || $check_field('add','work_experience') || $check_field('get','work_experience')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								工作经历:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_work_experience" v-model="form['work_experience']" placeholder="请输入工作经历" v-if="(form['work_experience'] && $check_field('set','work_experience')) || (!form['work_experience'] && $check_field('add','work_experience'))"  :disabled="disabledObj['work_experience_isDisabled']"/>
							<span v-else-if="$check_field('get','work_experience')">{{ form['work_experience'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','placement_time') || $check_field('add','placement_time') || $check_field('get','placement_time')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								投放时间:
							</span>
						</div>
								<!-- 日长 -->
						<div class="diy_field diy_datetime">
							<input type="datetime-local" :disabled="disabledObj['placement_time_isDisabled']" id="form_placement_time" v-model="form['placement_time']" placeholder="请输入投放时间" v-if="(form['placement_time'] && $check_field('set','placement_time')) || (!form['placement_time'] && $check_field('add','placement_time'))" />
							<span v-else-if="$check_field('get','placement_time')">{{ form['placement_time'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','resume_attachment') || $check_field('add','resume_attachment') || $check_field('get','resume_attachment')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								简历附件:
							</span>
						</div>
								<!-- 文件 -->
						<input type="file" style="display: none;" id="form_file_resume_attachment" title="resume_attachment" @change="change_file($event.target.files,'resume_attachment')"/>
						<!-- 修改权限 -->
						<div class="diy_field diy_img" v-if="form['resume_attachment'] && $check_field('set','resume_attachment')">
							<label for="form_file_resume_attachment">
								<!--<span>{{form['resume_attachment']}} </span>-->
								<a :href="$fullUrl(form['resume_attachment'])" target="_blank" style="color: rgb(64, 158, 255);">点击下载</a>
							</label>
						</div>
						<!-- 添加权限 -->
						<div class="diy_field diy_img" v-else-if="!form['resume_attachment'] && $check_field('add','resume_attachment')">
							<label for="form_file_resume_attachment">
								<div class="btn_add_img">
									<span>+</span>
								</div>
							</label>
						</div>
						<!-- 查询权限 -->
						<div class="diy_field diy_img" v-else-if="$check_field('get','resume_attachment')">
							<span>{{form['resume_attachment']}} </span>
						</div>
							</div>
							<div v-if="$check_field('set','reason_for_advertising_placement') || $check_field('add','reason_for_advertising_placement') || $check_field('get','reason_for_advertising_placement')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								投放原因:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_reason_for_advertising_placement" v-model="form['reason_for_advertising_placement']" placeholder="请输入投放原因" v-if="(form['reason_for_advertising_placement'] && $check_field('set','reason_for_advertising_placement')) || (!form['reason_for_advertising_placement'] && $check_field('add','reason_for_advertising_placement'))"  :disabled="disabledObj['reason_for_advertising_placement_isDisabled']"/>
							<span v-else-if="$check_field('get','reason_for_advertising_placement')">{{ form['reason_for_advertising_placement'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','resume_rating') || $check_field('add','resume_rating') || $check_field('get','resume_rating')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								简历评分:
							</span>
						</div>
								<!-- 选项 -->
						<div class="diy_field diy_down">
							<select id="form_resume_rating" v-model="form['resume_rating']" v-if="(form['resume_rating'] && $check_field('set','resume_rating')) || (!form['resume_rating'] && $check_field('add','resume_rating'))" >
								<option v-for="o in list_resume_rating" :value="o">
									{{o}}
								</option>
							</select>
							<span v-else-if="$check_field('get','resume_rating')">{{ form['resume_rating'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','resume_marking') || $check_field('add','resume_marking') || $check_field('get','resume_marking')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								简历标记:
							</span>
						</div>
								<!-- 选项 -->
						<div class="diy_field diy_down">
							<select id="form_resume_marking" v-model="form['resume_marking']" v-if="(form['resume_marking'] && $check_field('set','resume_marking')) || (!form['resume_marking'] && $check_field('add','resume_marking'))" >
								<option v-for="o in list_resume_marking" :value="o">
									{{o}}
								</option>
							</select>
							<span v-else-if="$check_field('get','resume_marking')">{{ form['resume_marking'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','posting_remarks') || $check_field('add','posting_remarks') || $check_field('get','posting_remarks')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								投放备注:
							</span>
						</div>
								<!-- 多文本 -->
						<div class="diy_field diy_desc">
							<textarea id="form_posting_remarks" v-model="form['posting_remarks']" v-if="(form['posting_remarks'] && $check_field('set','posting_remarks')) || (!form['posting_remarks'] && $check_field('add','posting_remarks'))" :disabled="disabledObj['posting_remarks_isDisabled']" />
							<span v-else-if="$check_field('get','posting_remarks')">{{ form['posting_remarks'] }}</span>
						</div>
							</div>
	


					<div v-if="$check_examine()" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								审核状态:
							</span>
						</div>
						<div class="diy_field diy_select" v-if="$check_action('/resume_information/edit','examine')">
							<!--<span> {{ form['examine_state'] }} </span>-->
							<select v-model="form['examine_state']">
								<option value="未审核">
									未审核
								</option>
								<option value="已通过">
									已通过
								</option>
								<option value="未通过">
									未通过
								</option>
							</select>
						</div>
						<div class="diy_field diy_text" v-else>
							<span>
								{{ form['examine_state'] }}
							</span>
						</div>
					</div>
					<div v-if="$check_examine()" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								审核回复:
							</span>
						</div>
						<div class="diy_field diy_desc" v-if="$check_action('/resume_information/edit','examine')">
							<textarea v-model="form['examine_reply']"></textarea>
						</div>
						<div class="diy_field diy_text" v-else>
							<span>
								{{ form['examine_reply'] }}
							</span>
						</div>
					</div>


				</div>
				<div class="diy_edit_submit_box row">
					<div class="col-12">
						<div class="btn_box">
							<button class="btn_submit" @click="submit()">提交</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import mixin from "@/mixins/page.js";
	export default {
		mixins: [mixin],
		components: {},
		data() {
			return {
				url_get_obj: "~/api/resume_information/get_obj?",
				url_add: "~/api/resume_information/add?",
				url_set: "~/api/resume_information/set?",

				// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
						"recruitment_title": "",
							"enterprise_name": "",
							"enterprise_users": 0,
							"job_type": "",
							"target_users": 0,
							"user_name": "",
							"user_gender": "",
							"user_age": "",
							"contact_information": "",
							"educational_background": "",
							"work_experience": "",
							"placement_time": "",
							"resume_attachment": "",
							"reason_for_advertising_placement": "",
							"resume_rating": "",
							"resume_marking": "",
							"posting_remarks": "",
						"resume_information_id": 0,
				},

				obj: {
						"recruitment_title":  '', // 招聘标题
							"enterprise_name":  '', // 企业名称
							"enterprise_users": 0, // 企业用户
							"job_type":  '', // 岗位类型
							"target_users": 0, // 投放用户
							"user_name":  '', // 用户姓名
							"user_gender":  '', // 用户性别
							"user_age":  '', // 用户年龄
							"contact_information":  '', // 联系方式
							"educational_background":  '', // 教育背景
							"work_experience":  '', // 工作经历
							"placement_time": new Date().getTime(),
							"resume_attachment":  '', // 简历附件
							"reason_for_advertising_placement":  '', // 投放原因
							"resume_rating":  '', // 简历评分
							"resume_marking":  '', // 简历标记
							"posting_remarks":  '', // 投放备注
						"examine_state": "未审核",
					"examine_reply": "",
					"resume_information_id": 0,
				},

				// 表单字段
				form: {
						"recruitment_title":  '', // 招聘标题
							"enterprise_name":  '', // 企业名称
							"enterprise_users": 0, // 企业用户
							"job_type":  '', // 岗位类型
							"target_users": 0, // 投放用户
							"user_name":  '', // 用户姓名
							"user_gender":  '', // 用户性别
							"user_age":  '', // 用户年龄
							"contact_information":  '', // 联系方式
							"educational_background":  '', // 教育背景
							"work_experience":  '', // 工作经历
							"placement_time": new Date().getTime(),
							"resume_attachment":  '', // 简历附件
							"reason_for_advertising_placement":  '', // 投放原因
							"resume_rating":  '', // 简历评分
							"resume_marking":  '', // 简历标记
							"posting_remarks":  '', // 投放备注
						"examine_state": "未审核",
					"examine_reply": "",
					"resume_information_id": 0,
				},
				disabledObj:{
						"recruitment_title_isDisabled": false,
							"enterprise_name_isDisabled": false,
							"enterprise_users_isDisabled": false,
							"job_type_isDisabled": false,
							"target_users_isDisabled": false,
							"user_name_isDisabled": false,
							"user_gender_isDisabled": false,
							"user_age_isDisabled": false,
							"contact_information_isDisabled": false,
							"educational_background_isDisabled": false,
							"work_experience_isDisabled": false,
							"placement_time_isDisabled": false,
							"resume_attachment_isDisabled": false,
							"reason_for_advertising_placement_isDisabled": false,
							"resume_rating_isDisabled": false,
							"resume_marking_isDisabled": false,
							"posting_remarks_isDisabled": false,
					},

												// 用户列表
				list_user_enterprise_users: [],
											// 用户列表
				list_user_target_users: [],
																																				// 简历评分选项列表
				list_resume_rating: ['一星','二星','三星','四星','五星'],
										// 简历标记选项列表
				list_resume_marking: ['待面试','不合适'],
						
				// ID字段
				field: "resume_information_id",

			}
		},
		methods: {
																																																																																																																																														formatDateValue(value) {
		  const date = new Date(value);
		  return `${date.getFullYear()}-${(date.getMonth() + 1).toString().padStart(2, '0')}-${date.getDate().toString().padStart(2, '0')}`;
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
      																																												let contact_information_phone_regular = /^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/;
		if(param.contact_information && !contact_information_phone_regular.test(param.contact_information)){
		  return "手机号格式错误"
		}
																	if (!param.placement_time){
			return "投放时间不能为空";
		}
																														        return null;
      },
			
				
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
			 * 获取注册用户用户列表
			 */
			async get_list_user_target_users() {
				var json = await this.$get("~/api/user/get_list?user_group=注册用户");
				if(json.result && json.result.list){
					this.list_user_target_users = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
					async get_user_session_target_users(){
				var _this = this;
				var json = await this.$get("~/api/user_group/get_obj?name=注册用户");
				if(json.result && json.result.obj){
					var source_table = json.result.obj.source_table;
					var user_id = _this.$store.state.user.user_id;
					if (user_id){
						var url = "~/api/"+source_table+"/get_obj?"
						this.$get(url, {"user_id":_this.$store.state.user.user_id}, function(res) {
							if (res.result && res.result.obj) {
								var arr = []
								for (let key in res.result.obj) {
									arr.push(key)
								}
								var arrForm = []
								for (let key in _this.form) {
									arrForm.push(key)
								}
								_this.form["target_users"] = user_id
								_this.disabledObj['target_users' + '_isDisabled'] = true
								for (var i=0;i<arr.length;i++){
                  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                    for (var j = 0; j < arrForm.length; j++) {
                      if (arr[i] === arrForm[j]) {
                        if (arr[i] !== "target_users") {
                          _this.form[arrForm[j]] = res.result.obj[arr[i]]
                          _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                          break;
                        }
                      }
                    }
                  }
								}
							}
						});
					}
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
				
				
				
				
				
				
				
				
				
				
				
				
		  		get_user_info(name,id){
				var obj = null;
      				  if (name == 'enterprise_users'){
					  obj = this.list_user_enterprise_users.getObj({"user_id":id});
				  }
      				  if (name == 'target_users'){
					  obj = this.list_user_target_users.getObj({"user_id":id});
				  }
                          				var ret = "";
				if(obj){
				  ret = obj.nickname+"-"+obj.username;
				}
				return ret;
			},
			/**
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file(files, str) {
				var form = new FormData();
				form.append("file", files[0]);
				this.$post("~/api/resume_information/upload?", form, (res) => {
					if (res.result) {
						this.form[str] = res.result.url;
					} else if (res.error) {
						this.$toast(res.error.message);
					}
				});
			},
			
			/**
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file_multiple(files, str) {
				let _this = this;
				var form = new FormData();
				for (var i = 0; i < files.length; i++) {
					form.set("file", files[i]);
					_this.$post("~/api/resume_information/upload?", form, (res) => {
						if (res.result) {
							if (_this.form[str].length > 0) {
								_this.form[str].push(res.result.url);
							} else {
								_this.form[str] = [res.result.url];
							}
						} else if (res.error) {
							_this.$toast(res.error.message);
						}
					});
				}
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_before(param){
				var form = $.db.get("form");
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
        //   this.obj = $.push(this.obj ,form);
				// 	this.form = $.push(this.form ,form);
				// }
				// var arr = []
				// for (let key in form) {
				// 	arr.push(key)
				// }
				// for (var i=0;i<arr.length;i++){
				// 	this.disabledObj[arr[i] + '_isDisabled'] = true
				// }
        if (form) {
          var arr = []
          for (let key in form) {
            arr.push(key)
          }
          var arrForm = []
          for (let key in this.form) {
            arrForm.push(key)
          }
          for (var i=0;i<arr.length;i++){
            if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
              for (var j = 0; j < arrForm.length; j++) {
                if (arrForm[j] === arr[i]) {
                  this.form[arrForm[j]] = form[arr[i]]
                  this.obj[arrForm[j]] = form[arr[i]]
                  this.disabledObj[arrForm[j] + '_isDisabled'] = true
                  break;
                }
              }
			  if(arr[i] === "source_table"){
			  	this.form['source_table'] = form[arr[i]]
			  }
			  if(arr[i] === "source_id"){
			  	this.form['source_id'] = form[arr[i]]
			  }
			  if(arr[i] === "source_user_id"){
			  	this.form['source_user_id'] = form[arr[i]]
			  }
            }
          }
        }
																																		        if (this.form["placement_time"] && JSON.stringify(this.form["placement_time"]).indexOf("-")===-1) {
          this.form["placement_time"] = this.$toTime(parseInt(this.form["placement_time"]), "yyyy-MM-ddThh:mm")
        }
																		
        $.db.del("form");
				return param;
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json ,func){
				// var form = $.db.get("form");
				// var obj = Object.assign({} ,form ,this.obj);
				// if (obj) {
        //   delete(obj.examine_state)
        //   delete(obj.examine_reply)
				// 	this.obj = $.push(this.obj ,obj);
				// }
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
				// 	this.form = $.push(this.form ,form);
				// }

				if(func){
					func(json);
				}
			},

		},
		created() {
												this.get_list_user_enterprise_users();
									this.get_user_session_target_users();
					this.get_list_user_target_users();
																																							},
	}
</script>

<style>
	.diy_compute{
		line-height: 40px;
	}
	.diy_field.diy_img_multiple{
		margin: 0;
	}
	.diy_field.diy_img_multiple div{
		float: left;
		position: relative;
		margin: 0 10px 10px 0;
	}
	.diy_field.diy_img_multiple img{
		height: 100px;
		width: auto;
	}
	.diy_field.diy_img_multiple span{
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
