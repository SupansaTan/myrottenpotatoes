const webpack = require('webpack')

module.exports = {
    resolve: {
        alias: {
            $: 'jquery/src/jquery',
            jQuery: 'jquery/src/jquery',
            jquery: 'jquery/src/jquery',
            'jquery-ui': 'jquery-ui-dist/jquery-ui.js'
        }
    },
    plugins: [
        new webpack.ProvidePlugin({
            $: 'jquery',
            jQuery: 'jquery'
        })
    ],
    // Eliminate CORS issue
    devServer: {
        host: 'localhost',
        port: 3000
    }
}