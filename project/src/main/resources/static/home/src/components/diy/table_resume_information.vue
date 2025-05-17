<template>
  <el-main class="bg table_wrap">
    <el-form label-position="right" :model="query" class="form p_4" label-width="120">
      <el-row class="rows row1">

          
                                                                                              <el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
                      <el-form-item label="企业名称">
                                                      <el-input v-model="query.enterprise_name"></el-input>
                                                </el-form-item>
                    </el-col>
                                                                                                                                                                      <el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
                      <el-form-item label="用户姓名">
                                                      <el-input v-model="query.user_name"></el-input>
                                                </el-form-item>
                    </el-col>
                                                                      <el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
                      <el-form-item label="用户性别">
                                                      <el-input v-model="query.user_gender"></el-input>
                                                </el-form-item>
                    </el-col>
                                                                                                                                                                                                                                                                                                                                                                                            <el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
            <el-form-item label="审核状态">
              <el-select v-model="query.examine_state">
                <el-option value="">全部</el-option>
                <el-option value="未审核">未审核</el-option>
                <el-option value="已通过">已通过</el-option>
                <el-option value="未通过">未通过</el-option>
              </el-select>
            </el-form-item>
          </el-col>
                      </el-row>
      <el-row class="rows row2">
      	<el-col :xs="24" :sm="24" :lg="24" class="search_btn_wrap search_btns">
         <el-col :xs="24" :sm="10" :lg="8" class="search_btn_1 search_btn_wrap_1 btns">
                              <el-button type="primary" @click="search()" class="search_btn_find">查询</el-button>
                <el-button @click="reset()" style="margin-right: 74px;" class="search_btn_reset">重置</el-button>
                                            <el-button v-if="$check_option('/resume_information/table','export_db')" @click="export_db('dataTable')"  class="derive" style="margin-right: 155px;">导出</el-button>
                                        <el-button v-if="$check_action('/resume_information/table','del') || $check_action('/resume_information/view','del')" class="search_btn_del" type="danger" @click="delInfo()">删除</el-button>
                              <download-excel v-if="$check_option('/resume_information/table','import_db')" class="export-excel-wrapper" :data="DetailsForm" :fields="json_fields" name="数据导入表格.xls" >
                  <el-button type="success">下载导入文档</el-button>
                </download-excel>
                <el-upload v-if="$check_option('/resume_information/table','import_db')" action accept = ".xlsx, .xls" :auto-upload="false" :show-file-list="false" :on-change="handle_import">
                  <el-button type="primary">导入</el-button>
                </el-upload>
                        </el-col>
       
        </el-col>
      </el-row>
    </el-form>
	    <el-table :data="list" @selection-change="selectionChange" @sort-change="$sortChange" style="width: 100%" id="dataTable">
	                <el-table-column type="selection" tooltip-effect="dark" width="55">
            </el-table-column>
                                                  <el-table-column prop="recruitment_title" @sort-change="$sortChange" label="招聘标题"                                v-if="$check_field('get','recruitment_title')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="enterprise_name" @sort-change="$sortChange" label="企业名称"                                v-if="$check_field('get','enterprise_name')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="enterprise_users" @sort-change="$sortChange" label="企业用户"                                v-if="$check_field('get','enterprise_users')" min-width="200">
                                      <template slot-scope="scope">
                      {{ get_user_enterprise_users(scope.row['enterprise_users']) }}
                    </template>
                                </el-table-column>
                                              <el-table-column prop="job_type" @sort-change="$sortChange" label="岗位类型"                                v-if="$check_field('get','job_type')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="target_users" @sort-change="$sortChange" label="投放用户"                                v-if="$check_field('get','target_users')" min-width="200">
                                      <template slot-scope="scope">
                      {{ get_user_target_users(scope.row['target_users']) }}
                    </template>
                                </el-table-column>
                                              <el-table-column prop="user_name" @sort-change="$sortChange" label="用户姓名"                                v-if="$check_field('get','user_name')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="user_gender" @sort-change="$sortChange" label="用户性别"                                v-if="$check_field('get','user_gender')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="user_age" @sort-change="$sortChange" label="用户年龄"                                v-if="$check_field('get','user_age')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="contact_information" @sort-change="$sortChange" label="联系方式"                                v-if="$check_field('get','contact_information')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="educational_background" @sort-change="$sortChange" label="教育背景"                                v-if="$check_field('get','educational_background')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="work_experience" @sort-change="$sortChange" label="工作经历"                                v-if="$check_field('get','work_experience')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="placement_time" @sort-change="$sortChange" label="投放时间"                                v-if="$check_field('get','placement_time')" min-width="200">
                                      <template slot-scope="scope">
                      {{ $toTime(scope.row["placement_time"],"yyyy-MM-dd hh:mm:ss") }}
                    </template>
                                </el-table-column>
                                              <el-table-column prop="resume_attachment" @sort-change="$sortChange" label="简历附件"                                v-if="$check_field('get','resume_attachment')" min-width="200">
                                      <template slot-scope="scope">
                      <a :href="$fullUrl(scope.row['resume_attachment'])" target="_blank" style="color: rgb(64, 158, 255);">点击下载</a>
                    </template>
                                </el-table-column>
                                              <el-table-column prop="reason_for_advertising_placement" @sort-change="$sortChange" label="投放原因"                                v-if="$check_field('get','reason_for_advertising_placement')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="resume_rating" @sort-change="$sortChange" label="简历评分"                                v-if="$check_field('get','resume_rating')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="resume_marking" @sort-change="$sortChange" label="简历标记"                                v-if="$check_field('get','resume_marking')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="posting_remarks" @sort-change="$sortChange" label="投放备注"                                v-if="$check_field('get','posting_remarks')" min-width="200">
                                </el-table-column>
                    				                  <el-table-column label="审核状态" prop="examine_state">
          </el-table-column>
        
                  <el-table-column label="审核回复" prop="examine_reply">
          </el-table-column>
        
                
      <el-table-column sortable prop="create_time" label="创建时间" min-width="200">
        <template slot-scope="scope">
          {{ $toTime(scope.row["create_time"],"yyyy-MM-dd hh:mm:ss") }}
        </template>
      </el-table-column>

      <el-table-column sortable prop="update_time" label="更新时间" min-width="200">
        <template slot-scope="scope">
          {{ $toTime(scope.row["update_time"],"yyyy-MM-dd hh:mm:ss") }}
        </template>
      </el-table-column>

        
        
        
        
        

                <el-table-column label="操作" min-width="120" v-if="$check_action('/resume_information/table','set') || $check_action('/resume_information/view','set') || $check_action('/resume_information/view','get')
												|| $check_action('/interview_notice/table','add') || $check_action('/interview_notice/view','add')
											 ">
        

      <template slot-scope="scope">
        <router-link class="el-button el-button--small is-plain el-button--success" style="margin: 5px !important;"
                     v-if="$check_action('/resume_information/table','set') || $check_action('/resume_information/view','set') || $check_action('/resume_information/view','get')"
                                 :to="'./view?' + field + '=' + scope.row[field]"
                                 size="small">
          <span>详情</span>
        </router-link>
                                        <!--跨表按钮-->
                  										<el-button class="el-button el-button--small is-plain el-button--default" style="margin: 5px !important;" size="small"  @click="to_table(scope.row,'/interview_notice/view')" v-if="($check_action('/interview_notice/table','add') || $check_action('/interview_notice/view','add')) && scope.row['examine_state'] == '已通过' && !scope.row['interview_notice_limit']">
					  <span>邀请面试</span>
					</el-button>
					                                                                        		  		  		  	<el-button class="el-button el-button--small is-plain el-button--default" style="margin: 5px !important;" size="small" @click="changeSigning(scope.row, scope.$index)" v-if="$check_option('/resume_information/table', 'examine')">
		  		<span>审核</span>
		  	</el-button>
		        </template>
    </el-table-column>

    </el-table>

    <!-- 分页器 -->
    <div class="mt text_center">
      <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
                     :current-page="query.page" :page-sizes="[7, 10, 30, 100]" :page-size="query.size"
                     layout="total, sizes, prev, pager, next, jumper" :total="count">
      </el-pagination>
    </div>
    <!-- /分页器 -->
		<el-dialog title="审核" :visible.sync="dialogVisible" width="30%" :show-close="true" :before-close="handleClose">
			<el-form ref="verifyForm" :rules="rules" :model="verifyItem">
				<el-form-item label="审核状态" prop="radio">
					<el-radio-group v-model="verifyItem.examine_state" style="margin-top: 9px;">
						<el-radio label="已通过" value="已通过"></el-radio>
						<el-radio label="未通过" value="已通过"></el-radio>
					</el-radio-group>
				</el-form-item>
								<el-form-item label="审核回复" prop="reply">
					<el-input type="textarea" placeholder="请填写审核回复" v-model="verifyItem.examine_reply"></el-input>
				</el-form-item>
							</el-form>
			<span slot="footer" class="dialog-footer">
				<el-button @click="dialogVisible = false">取 消</el-button>
				<el-button type="primary" @click="assureVerify">确 定</el-button>
			</span>
		</el-dialog>
                                                                                                                                                                                                                                                                                                  
    <div class="modal_wrap" v-if="showModal">
      <div class="modal_box">
        <!-- <div class="modal_box_close" @click="closeModal">X</div> -->
        <p class="modal_box_title">重要提醒</p>
        <p class="modal_box_text">当前有数据达到预警值！</p>
        <p class="modal_box_text">{{ message }}</p>
        <div class="btn_box">
          <span @click="closeModal">取消</span>
          <span @click="closeModal">确定</span>
        </div>
      </div>
    </div>


  </el-main>
</template>
<script>
  import mixin from "@/mixins/page.js";
    import * as XLSX from 'xlsx/xlsx.mjs'
  
  export default {
    mixins: [mixin],
    data() {
      return {
        // 弹框
        showModal: false,
        // 获取数据地址
        url_get_list: "~/api/resume_information/get_list?like=0",
        url_del: "~/api/resume_information/del?",

        // 字段ID
        field: "resume_information_id",
		dialogVisible: false,
		verifyIdx: 0,
		verifyItem: {},
		rules: {
			"examine_state": [
				{ required: true, message: '请选择审核状态', trigger: 'change' },
			],
		},
        // 查询
        query: {
          "size": 7,
          "page": 1,
                                                                                                  "enterprise_name": "",
                                                                                                                                                                                              "user_name": "",
                                                                                                          "user_gender": "",
                                                                                                                                                                                                                                                                                                                                                            "examine_state":"",
                                          "login_time": "",
          "create_time": "",
          "orderby": `create_time desc`
        },

                  // 数据
        list: [],
                                          json_fields: {
                                                  "招聘标题":'recruitment_title',
                                  "企业名称":'enterprise_name',
                                  "企业用户":'enterprise_users',
                                  "岗位类型":'job_type',
                                  "投放用户":'target_users',
                                  "用户姓名":'user_name',
                                  "用户性别":'user_gender',
                                  "用户年龄":'user_age',
                                  "联系方式":'contact_information',
                                  "教育背景":'educational_background',
                                  "工作经历":'work_experience',
                                  "投放时间":'placement_time',
                                  "简历附件":'resume_attachment',
                                  "投放原因":'reason_for_advertising_placement',
                                  "简历评分":'resume_rating',
                                  "简历标记":'resume_marking',
                                  "投放备注":'posting_remarks',
                            },
            DetailsForm: [
              {
                                                              recruitment_title:"文本类型",
                                            enterprise_name:"文本类型",
                                            enterprise_users:"UID类型",
                                            job_type:"文本类型",
                                            target_users:"UID类型",
                                            user_name:"文本类型",
                                            user_gender:"文本类型",
                                            user_age:"文本类型",
                                            contact_information:"手机类型",
                                            educational_background:"文本类型",
                                            work_experience:"文本类型",
                                            placement_time:"日长类型",
                                            resume_attachment:"文件类型",
                                            reason_for_advertising_placement:"文本类型",
                                            resume_rating:"下拉类型",
                                            resume_marking:"下拉类型",
                                            posting_remarks:"多文本类型",
                                },
            ],
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                // 用户列表
                list_user_enterprise_users: [],
                                                                                                                            // 用户列表
                list_user_target_users: [],
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                		  		  message: '',
      }
    },
    methods: {
      // 关闭弹框
      closeModal(){
        this.showModal = false;
      },
        			// 审核弹窗
			changeSigning(query, index) {
			  let beforeQuery=JSON.parse(JSON.stringify(query));
			  this.verifyIdx = index;
			  this.verifyItem = beforeQuery;
			  this.dialogVisible = true;
			},
			assureVerify() {
				//审核
				let _this = this;
				let examineForm = this.$refs["verifyForm"];
				examineForm.validate((valid) => {
					if (valid) {
						var url = "~/api/resume_information/set?resume_information_id=" + this.verifyItem['resume_information_id']
						_this.$post(url, {
							'examine_state': _this.verifyItem.examine_state,
														'examine_reply': _this.verifyItem.examine_reply
													}, (json, status) => {
							if (json.result) {
								_this.$toast('审核成功！', 'success');
								_this.dialogVisible = false;
								_this.get_list();
							} else if (json.error) {
								_this.$toast(json.error.message, 'danger');
							}
						})
					}
				})
			},
		  /**
		   * @description 获取到列表事件
		   * @param {Object} res 响应结果
		   */
		  get_list_after: function get_list_after(res, func, url) {
		  	let _this = this
					  			  	_this.list.map((item) => {
		  		let param = {
		  			source_table: "resume_information",
		  			source_id: item.resume_information_id,
		  			source_user_id: _this.user.user_id
		  		};
		  		if(item.interview_notice_limit_times > 0){
		  			_this.$get("~/api/interview_notice/count?",param,(result)=>{
		  				if(result){
		  					if(result.result >= item.interview_notice_limit_times){
		  						_this.$set(item,'interview_notice_limit',true);
		  					}else{
		  						_this.$set(item,'interview_notice_limit',false);
		  					}
		  				}
		  			})
		  		}else{
		  			_this.$set(item,'interview_notice_limit',false);
		  		}
		  		Object.assign(item, param)
		  	})
		  																																																										  },
        
                  get_list_before(param){
            var user_group = this.$store.state.user.user_group;
            if(user_group != "管理员"){
                                  let sqlwhere = "(";
                                                                                                                                                              if(user_group=="企业用户"){
                            sqlwhere+= "enterprise_users = " + this.$store.state.user.user_id + " or ";
                          }
                                                                                                                                          if(user_group=="注册用户"){
                            sqlwhere+= "target_users = " + this.$store.state.user.user_id + " or ";
                          }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              if (sqlwhere.length>1){
                    sqlwhere = sqlwhere.substr(0,sqlwhere.length-4);
                    sqlwhere += ")";
                    param["sqlwhere"] = sqlwhere;
                  }
                            }
            return param;
          },
        
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
                  /**
           * 导出
           */
          export_db(tableid){
            // var query = this.query;
            // this.$get("~/api/resume_information/export_db?",query,(json)=>{
            // 	if(json.result){
            // 		console.log(json.result);
            // 	}else if(json.error){
            // 		console.error(json.error);
            // 	}
            // });


            //导出表格
            var idTmr;

            function getExplorer() {
              var explorer = window.navigator.userAgent;
              //ie
              if(explorer.indexOf("MSIE") >= 0) {
                return 'ie';
              }
              //firefox
              else if(explorer.indexOf("Firefox") >= 0) {
                return 'Firefox';
              }
              //Chrome
              else if(explorer.indexOf("Chrome") >= 0) {
                return 'Chrome';
              }
              //Opera
              else if(explorer.indexOf("Opera") >= 0) {
                return 'Opera';
              }
              //Safari
              else if(explorer.indexOf("Safari") >= 0) {
                return 'Safari';
              }
            }
            function Cleanup() {
              window.clearInterval(idTmr);
              CollectGarbage();
            }
            var tableToExcel = (function() {
              var uri = 'data:application/vnd.ms-excel;base64,',
                  template = '<html><head><meta charset="UTF-8"></head><body><table  border="1">{table}</table></body></html>',
                  base64 = function(
                      s) {
                    return window.btoa(unescape(encodeURIComponent(s)))
                  },
                  format = function(s, c) {
                    return s.replace(/{(\w+)}/g, function(m, p) {
                      return c[p];
                    })
                  }
              return function(table, name) {
                if(!table.nodeType)
                  table = document.getElementById(table)
                var ctx = {
                  worksheet: name || 'Worksheet',
                  table: table.innerHTML
                }
                window.location.href = uri + base64(format(template, ctx))
              }
            })();
            if(getExplorer() == 'ie') {
              var curTbl = document.getElementById(tableid);
              var oXL = new ActiveXObject("Excel.Application");
              var oWB = oXL.Workbooks.Add();
              var xlsheet = oWB.Worksheets(1);
              var sel = document.body.createTextRange();
              sel.moveToElementText(curTbl);
              sel.select();
              sel.execCommand("Copy");
              xlsheet.Paste();
              oXL.Visible = true;

              try {
                var fname = oXL.Application.GetSaveAsFilename("Excel.xls",
                    "Excel Spreadsheets (*.xls), *.xls");
              } catch(e) {
                print("Nested catch caught " + e);
              } finally {
                oWB.SaveAs(fname);
                oWB.Close(savechanges = false);
                oXL.Quit();
                oXL = null;
                idTmr = window.setInterval("Cleanup();", 1);
              }

            } else {
              tableToExcel(tableid)
            }


          },
        
        
                  /**
           * 导入
           */
          readFile(file){//文件读取
            return new Promise(resolve => {
              let reader = new FileReader();
              reader.readAsBinaryString(file);//以二进制的方式读取
              reader.onload = ev =>{
                resolve(ev.target.result);
              }
            })
          },
          async handle_import(ev){
            let file = ev.raw;
            console.log(file)
            if(!file){
              console.log("文件打开失败")
              return ;
            }else{
              let data = await this.readFile(file);
              let workbook = XLSX.read(data,{ type: "binary"});//解析二进制格式数据
              let worksheet = workbook.Sheets[workbook.SheetNames[0]];//获取第一个Sheet
              let result = XLSX.utils.sheet_to_json(worksheet);//json数据格式
              result.forEach((item) => {
                // 将中文的键名替换成英文的
                for (let k in this.json_fields) {
                  let newKey = this.json_fields[k];
                  if (newKey) {
                    item[newKey] = item[k];
                    delete item[k];
                  }
                }
              });
              let _this = this;
                                  for (let i=0;i<result.length;i++){
                    let url = "~/api/resume_information/add?";
                    await this.$post(url, result[i], function (json, status) {
                      console.log("提交结果：", json);
                      if (json.result) {
                        _this.$toast("操作成功", 'success');
                      } else if (json.error) {
                        _this.$toast(json.error.message, 'danger');
                      }
                    });
                  }
                            }
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

              get_user_enterprise_users(id){
                var obj = this.list_user_enterprise_users.getObj({"user_id":id});
                var ret = "";
                if(obj){
                  ret = obj.nickname+"-"+obj.username;
                  // if(obj.nickname){
                  // 	ret = obj.nickname;
                  // }
                  // else{
                  // 	ret = obj.username;
                  // }
                }
                return ret;
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

              get_user_target_users(id){
                var obj = this.list_user_target_users.getObj({"user_id":id});
                var ret = "";
                if(obj){
                  ret = obj.nickname+"-"+obj.username;
                  // if(obj.nickname){
                  // 	ret = obj.nickname;
                  // }
                  // else{
                  // 	ret = obj.username;
                  // }
                }
                return ret;
              },
                                                                                                                                                                                                                                                                                                                                                                                                                                                        		      deleteRow(index, rows) {
        rows.splice(index, 1);
      },

    },
	    created() {
                                                                                                                                      this.get_list_user_enterprise_users();
                                                                                                          this.get_list_user_target_users();
                                                                                                                                                                                                                                                                                                                                                                                                                                }
  }
</script>

<style type="text/css">
  .bg {
    background: white;
  }

  .form.p_4 {
    padding: 1rem;
  }

  .form .el-input {
    width: initial;
  }

  .mt {
    margin-top: 1rem;
  }

  .text_center {
    text-align: center;
  }

  .float-right {
    float: right;
  }


  .modal_wrap{
    width: 100vw;
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
    background: rgba(0,0,0,0.5);
    z-index: 9999999999;
  }
  .modal_wrap .modal_box{
    width: 400px;
    height: auto;
    background: url("../../assets/modal_bg.jpg") no-repeat center;
    background-size: cover;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-left: -200px;
    margin-top: -100px;
    border-radius: 10px;
    padding: 10px;
  }
  .modal_wrap .modal_box .modal_box_close{
    font-size: 20px;
    position: absolute;
    top: 10px;
    right: 10px;
    cursor: pointer;
  }
  .modal_wrap .modal_box .modal_box_title{
    text-align: center;
    font-size: 18px;
    margin: 16px auto;
    color: #fff;
    border-bottom: 1px solid rgba(117, 116, 116,0.5);
    padding-bottom: 16px;
    width: 356px;
  }
  .modal_wrap .modal_box .modal_box_text{
    text-align: center;
    font-size: 14px;
    color: #fff;
    margin: 5px auto;
    width: 90%;
  }
  .modal_wrap .modal_box .btn_box{
    display: flex;
    flex-direction: row;
    justify-content: center;
    margin-top: 42px;
  }
  .modal_wrap .modal_box .btn_box span{
    display: inline-block;
    width: 80px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    border: 1px solid #ccc;
    font-size: 14px;
    cursor: pointer;
    color: #fff;
  }
  .modal_wrap .modal_box .btn_box span:nth-child(2){
    background: #409EFF;
    color: #fff;
    border-color: #409EFF;
    margin-left: 15px;
  }
  .el-date-editor .el-range-separator{
  	width: 10% !important;
  }
</style>
