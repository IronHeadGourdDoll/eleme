// vue.config.js
const path = require('path');
function resolve (dir) {
    return path.join(__dirname, dir)
}

module.exports = {
	//路径允许@
	configureWebpack: {
    	resolve: {
      		alias: {
        		'@': resolve('src')
      		}
    	}
	  },
    chainWebpack: config => {
		// config.resolve.alias
		// 	.set("@", resolve("src"))
    },

    // webpack-dev-server 相关配置
  devServer: {
    host: '0.0.0.0',
    port: 8080,
    open: true,
    proxy: {
      // detail: https://cli.vuejs.org/config/#devserver-proxy
      [process.env.VUE_APP_BASE_API]: {
        target: `http://localhost:8080`,
        changeOrigin: true,
        pathRewrite: {
          ['^' + process.env.VUE_APP_BASE_API]: ''
        }
      }
    },
    disableHostCheck: true
  },
    //其他配置....
}