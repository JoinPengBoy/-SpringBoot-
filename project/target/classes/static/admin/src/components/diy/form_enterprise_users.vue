<template>
	<div>
			<el-form-item v-if="$check_register_field('add','enterprise_name','/enterprise_users/view')" label="企业名称" prop="enterprise_name">
				<el-input id="enterprise_name" v-model="form['enterprise_name']" placeholder="请输入企业名称" ></el-input>
				</el-form-item>
				<el-form-item v-if="$check_register_field('add','registered_capital','/enterprise_users/view')" label="注册资本" prop="registered_capital">
				<el-input id="registered_capital" v-model="form['registered_capital']" placeholder="请输入注册资本" ></el-input>
				</el-form-item>
				<el-form-item v-if="$check_register_field('add','enterprise_location','/enterprise_users/view')" label="企业位置" prop="enterprise_location">
				<el-input id="enterprise_location" v-model="form['enterprise_location']" placeholder="请输入企业位置" ></el-input>
				</el-form-item>
				<el-form-item v-if="$check_register_field('add','business_license','/enterprise_users/view')" label="营业执照" prop="business_license">
				<el-upload id="business_license" class="avatar-uploader" drag
			accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="uploadimg_business_license"
			:show-file-list="false" >
			<img v-if="form['business_license']" :src="$fullUrl(form['business_license'])" class="avatar">
			<i v-else class="el-icon-plus avatar-uploader-icon"></i>
		</el-upload>
				</el-form-item>
	
	</div>
</template>

<script>
	import mixin from "@/mixins/component.js";

	export default {
		mixins: [mixin],
		props:{

			form:{
				type: Object,
				default: function(){
					return {
							"enterprise_name":  '' ,
								"registered_capital":  '' ,
								"enterprise_location":  '' ,
								"business_license":  '' ,
						}
				}
			},

		},
		data() {
			return {
				field: "enterprise_users_id",
				url_add: "~/api/enterprise_users/add?",
				url_set: "~/api/enterprise_users/set?",
				url_upload: "~/api/enterprise_users/upload?",

												rules: {
					"enterprise_name": [    {required: true,message: '企业名称不能为空'},  ],
					"registered_capital": [    {required: true,message: '注册资本不能为空'},  ],
					"enterprise_location": [    {required: true,message: '企业位置不能为空'},  ],
					"business_license": [    {required: true,message: '营业执照不能为空'},  ],
				}

			}
		},
		methods: {
	
	
		
	
		
	
					/**
			 * 上传营业执照
			 * @param {Object} param 图片参数
			 */
			uploadimg_business_license(param) {
								this.uploadFile(param.file, "business_license");
							},
	
	
			},
		created() {
										}
	}
</script>
