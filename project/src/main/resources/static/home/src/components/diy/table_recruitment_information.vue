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
                      <el-form-item label="注册资本">
                                                      <el-input v-model="query.registered_capital"></el-input>
                                                </el-form-item>
                    </el-col>
                                                                      <el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
                      <el-form-item label="岗位类型">
                                                      <el-select v-model="query.job_type">
                                                                  <el-option v-for="o in list_job_type" :key="o.job_type" :label="o.job_type"
                                             :value="o.job_type">
                                  </el-option>
                                                            </el-select>
                                                </el-form-item>
                    </el-col>
                                                                                                                                                                                                                                                                </el-row>
      <el-row class="rows row2">
      	<el-col :xs="24" :sm="24" :lg="24" class="search_btn_wrap search_btns">
         <el-col :xs="24" :sm="10" :lg="8" class="search_btn_1 search_btn_wrap_1 btns">
                              <el-button type="primary" @click="search()" class="search_btn_find">查询</el-button>
                <el-button @click="reset()" style="margin-right: 74px;" class="search_btn_reset">重置</el-button>
                                                      <el-button v-if="$check_action('/recruitment_information/table','add') || $check_action('/recruitment_information/view','add')" @click="$router.push('./view?')" class="add">添加</el-button>
            <el-button v-if="$check_action('/recruitment_information/table','del') || $check_action('/recruitment_information/view','del')" class="search_btn_del" type="danger" @click="delInfo()">删除</el-button>
                        </el-col>
       
        </el-col>
      </el-row>
    </el-form>
	    <el-table :data="list" @selection-change="selectionChange" @sort-change="$sortChange" style="width: 100%" id="dataTable">
	                <el-table-column fixed type="selection" tooltip-effect="dark" width="55">
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
                                              <el-table-column prop="registered_capital" @sort-change="$sortChange" label="注册资本"                                v-if="$check_field('get','registered_capital')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="job_type" @sort-change="$sortChange" label="岗位类型"                                v-if="$check_field('get','job_type')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="cover_photo" @sort-change="$sortChange" label="封面图片"                                v-if="$check_field('get','cover_photo')" min-width="200">
                                      <template slot-scope="scope">
                      <el-image style="width: 100px; height: 100px" :src="$fullUrl(scope.row['cover_photo'])"
                                :preview-src-list="[$fullUrl(scope.row['cover_photo'])]">
                        <div slot="error" class="image-slot">
                          <img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
                        </div>
                      </el-image>
                    </template>
				                </el-table-column>
                                              <el-table-column prop="salary_amount" @sort-change="$sortChange" label="薪资金额"                                v-if="$check_field('get','salary_amount')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="professional_requirements" @sort-change="$sortChange" label="需求专业"                                v-if="$check_field('get','professional_requirements')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="work_location" @sort-change="$sortChange" label="工作地点"                                v-if="$check_field('get','work_location')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="recruitment_positions" @sort-change="$sortChange" label="招聘职位"                                v-if="$check_field('get','recruitment_positions')" min-width="200">
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

        
        
        
        
        

                <el-table-column fixed="right" label="操作" min-width="120" v-if="$check_action('/recruitment_information/table','set') || $check_action('/recruitment_information/view','set') || $check_action('/recruitment_information/view','get')
					 ">
        

      <template slot-scope="scope">
        <router-link class="el-button el-button--small is-plain el-button--success" style="margin: 5px !important;"
                     v-if="$check_action('/recruitment_information/table','set') || $check_action('/recruitment_information/view','set') || $check_action('/recruitment_information/view','get')"
                                 :to="'./view?' + field + '=' + scope.row[field]"
                                 size="small">
          <span>详情</span>
        </router-link>
                                                            <router-link v-if="$check_comment('/recruitment_information/table')" class="el-button el-button--small is-plain el-button--primary"
                             :to="'../comment/table?size=10&page=1&source_table=recruitment_information&source_field=' + field + '&source_id=' + scope.row[field]" size="small">
                  查看评论
                </router-link>
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
  
  export default {
    mixins: [mixin],
    data() {
      return {
        // 弹框
        showModal: false,
        // 获取数据地址
        url_get_list: "~/api/recruitment_information/get_list?like=0",
        url_del: "~/api/recruitment_information/del?",

        // 字段ID
        field: "recruitment_information_id",
        // 查询
        query: {
          "size": 7,
          "page": 1,
                                                                                                  "enterprise_name": "",
                                                                                                                                      "registered_capital": "",
                                                                                                          "job_type": "",
                                                                                                                                                                                                                                                                  "login_time": "",
          "create_time": "",
          "orderby": `create_time desc`
        },

                  // 数据
        list: [],
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    // 用户列表
                list_user_enterprise_users: [],
                                                                                            // 岗位类型列表
                list_job_type: [""],
                                                                                                                                                                                                                                                                          		  		  message: '',
      }
    },
    methods: {
      // 关闭弹框
      closeModal(){
        this.showModal = false;
      },
        		  /**
		   * @description 获取到列表事件
		   * @param {Object} res 响应结果
		   */
		  get_list_after: function get_list_after(res, func, url) {
		  	let _this = this
																																					  },
        
                  get_list_before(param){
            var user_group = this.$store.state.user.user_group;
            if(user_group != "管理员"){
                                  let sqlwhere = "(";
                                                                                                                                                              if(user_group=="企业用户"){
                            sqlwhere+= "enterprise_users = " + this.$store.state.user.user_id + " or ";
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
               * 获取岗位类型列表
               */
              async get_list_job_type() {
                var json = await this.$get("~/api/job_type/get_list?");
                if(json.result){
                  this.list_job_type = json.result.list;
                }else if (json.error){
                  console.log(json.error);
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
                                                                                                                                                                                                                                                                                                                        		      deleteRow(index, rows) {
        rows.splice(index, 1);
      },

    },
	    created() {
                                                                                                                                      this.get_list_user_enterprise_users();
                                                                              // 初始化岗位类型列表
              this.get_list_job_type();
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
