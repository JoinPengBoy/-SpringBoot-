import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue';
import login from '../views/login.vue';
import forgot from '../views/forgot.vue';
import register from '../views/register.vue';
Vue.use(VueRouter)

const routes = [
    // 主页
    {
        path: '/',
        name: 'index',
        component: index,
        meta: {
            index: 0,
            title: '首页'
        }
    },

    // 登录
    {
        path: '/login',
        name: 'login',
        component: login,
        meta: {
            index: 0,
            title: '登录'
        }
    },

            // 注册
        {
            path: '/register',
            name: 'register',
            component: register,
            meta: {
                index: 0,
                title: '注册'
            }
        },
    	
	
    // 忘记密码
    {
        path: '/forgot',
        name: "forgot",
        component: forgot,
        meta: {
            index: 0,
            title: '忘记密码'
        }
    },

    // 修改密码
    {
        path: '/user/password',
        name: "password",
        component: () => import("../views/user/password.vue"),
        meta: {
            index: 0,
            title: '修改密码'
        }
    },

    // 视频播放页
    {
        path: "/media/video",
        name: "video",
        component: () => import('../views/media/video.vue'),
        meta: {
            index: 0,
            title: "视频"
        }
    },

    // 音频播放页
    {
        path: "/media/audio",
        name: "audio",
        component: () => import('../views/media/audio.vue'),
        meta: {
            index: 0,
            title: "音频"
        }
    },

    
    
                // 轮播图路由
        {
            path: '/slides/table',
            name: 'slides_table',
            component: () => import('../views/slides/table.vue'),
            meta: {
                index: 0,
                title: '轮播图列表'
            }
        },
        {
            path: '/slides/view',
            name: 'slides_view',
            component: () => import('../views/slides/view.vue'),
            meta: {
                index: 0,
                title: '轮播图详情'
            }
        },
                    // 文章路由
            {
                path: '/article/table',
                name: 'article_table',
                component: () => import('../views/article/table.vue'),
                meta: {
                    index: 0,
                    title: '新闻资讯列表'
                }
            },
            {
                path: '/article/view',
                name: 'article_view',
                component: () => import('../views/article/view.vue'),
                meta: {
                    index: 0,
                    title: '新闻资讯详情'
                }
            },

            // 文章分类路由
            {
                path: '/article_type/table',
                name: 'article_type_table',
                component: () => import('../views/article_type/table.vue'),
                meta: {
                    index: 0,
                    title: '新闻资讯分类列表'
                }
            },
            {
                path: '/article_type/view',
                name: 'article_type_view',
                component: () => import('../views/article_type/view.vue'),
                meta: {
                    index: 0,
                    title: '新闻资讯分类详情'
                }
            },
                            
    
            // 论坛路由
        {
            path: '/forum/table',
            name: 'forum_table',
            component: () => import('../views/forum/table.vue'),
            meta: {
                index: 0,
                title: '论坛列表'
            }
        },
        {
            path: '/forum/view',
            name: 'forum_view',
            component: () => import('../views/forum/view.vue'),
            meta: {
                index: 0,
                title: '论坛详情'
            }
        },

        // 论坛分类路由
        {
            path: '/forum_type/table',
            name: 'forum_type_table',
            component: () => import('../views/forum_type/table.vue'),
            meta: {
                index: 0,
                title: '论坛分类列表'
            }
        },
        {
            path: '/forum_type/view',
            name: 'forum_type_view',
            component: () => import('../views/forum_type/view.vue'),
            meta: {
                index: 0,
                title: '论坛分类详情'
            }
        },
    
            // 公告路由
        {
            path: '/notice/table',
            name: 'notice_table',
            component: () => import('../views/notice/table.vue'),
            meta: {
                index: 0,
                title: '公告通知列表'
            }
        },
        {
            path: '/notice/view',
            name: 'notice_view',
            component: () => import('../views/notice/view.vue'),
            meta: {
                index: 0,
                title: '公告通知详情'
            }
        },
            	    
            // 评论路由
        {
            path: '/comment/table',
            name: 'comment_table',
            component: () => import('../views/comment/table.vue'),
            meta: {
                index: 0,
                title: '评论列表'
            }
        },
        {
            path: '/comment/view',
            name: 'comment_view',
            component: () => import('../views/comment/view.vue'),
            meta: {
                index: 0,
                title: '评论详情'
            }
        },
        	            // 注册用户路由
        {
            path: '/registered_user/table',
            name: 'registered_user_table',
            component: () => import('../views/registered_user/table.vue'),
            meta: {
                index: 0,
                title: '注册用户列表'
            }
        },
        {
            path: '/registered_user/view',
            name: 'registered_user_view',
            component: () => import('../views/registered_user/view.vue'),
            meta: {
                index: 0,
                title: '注册用户详情'
            }
        },
						            // 企业用户路由
        {
            path: '/enterprise_users/table',
            name: 'enterprise_users_table',
            component: () => import('../views/enterprise_users/table.vue'),
            meta: {
                index: 0,
                title: '企业用户列表'
            }
        },
        {
            path: '/enterprise_users/view',
            name: 'enterprise_users_view',
            component: () => import('../views/enterprise_users/view.vue'),
            meta: {
                index: 0,
                title: '企业用户详情'
            }
        },
						            // 招聘信息路由
        {
            path: '/recruitment_information/table',
            name: 'recruitment_information_table',
            component: () => import('../views/recruitment_information/table.vue'),
            meta: {
                index: 0,
                title: '招聘信息列表'
            }
        },
        {
            path: '/recruitment_information/view',
            name: 'recruitment_information_view',
            component: () => import('../views/recruitment_information/view.vue'),
            meta: {
                index: 0,
                title: '招聘信息详情'
            }
        },
						            // 岗位类型路由
        {
            path: '/job_type/table',
            name: 'job_type_table',
            component: () => import('../views/job_type/table.vue'),
            meta: {
                index: 0,
                title: '岗位类型列表'
            }
        },
        {
            path: '/job_type/view',
            name: 'job_type_view',
            component: () => import('../views/job_type/view.vue'),
            meta: {
                index: 0,
                title: '岗位类型详情'
            }
        },
						            // 简历信息路由
        {
            path: '/resume_information/table',
            name: 'resume_information_table',
            component: () => import('../views/resume_information/table.vue'),
            meta: {
                index: 0,
                title: '简历信息列表'
            }
        },
        {
            path: '/resume_information/view',
            name: 'resume_information_view',
            component: () => import('../views/resume_information/view.vue'),
            meta: {
                index: 0,
                title: '简历信息详情'
            }
        },
						            // 面试通知路由
        {
            path: '/interview_notice/table',
            name: 'interview_notice_table',
            component: () => import('../views/interview_notice/table.vue'),
            meta: {
                index: 0,
                title: '面试通知列表'
            }
        },
        {
            path: '/interview_notice/view',
            name: 'interview_notice_view',
            component: () => import('../views/interview_notice/view.vue'),
            meta: {
                index: 0,
                title: '面试通知详情'
            }
        },
						    	    // 用户路由
    {
        path: '/user/table',
        name: 'user_table',
        component: () => import('../views/user/table.vue'),
        meta: {
            index: 0,
            title: '用户列表'
        }
    },
    {
        path: '/user/view',
        name: 'user_view',
        component: () => import('../views/user/view.vue'),
        meta: {
            index: 0,
            title: '用户详情'
        }
    },
    {
        path: '/user/info',
        name: 'user_info',
        component: () => import('../views/user/info.vue'),
        meta: {
            index: 0,
            title: '个人信息'
        }
    },
    // 用户组路由
    {
        path: '/user_group/table',
        name: 'user_group_table',
        component: () => import('../views/user_group/table.vue'),
        meta: {
            index: 0,
            title: '用户组列表'
        }
    },
    {
        path: '/user_group/view',
        name: 'user_group_view',
        component: () => import('../views/user_group/view.vue'),
        meta: {
            index: 0,
            title: '用户组详情'
        }
    }
]

const router = new VueRouter({
    mode: 'hash',
    base: process.env.BASE_URL,
    routes
})

router.beforeEach((to, from, next) => {
    let token = to.query.token;
    if (token) {
        $.db.set("token", token, 120);
    }
    next();
})

router.afterEach((to, from, next) => {
    let title = "简历生成器-admin";
    document.title = title;
})

export default router
