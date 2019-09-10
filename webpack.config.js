const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const isDevelopment = process.env.NODE_ENV !== 'production';

module.exports = {
  mode: isDevelopment ? 'development' : 'production',
  entry: {
    // Javascripts
    'bootstrap': './assets/javascripts/bootstrap.js',

    // Stylesheets
    'elate/bootstrap': './assets/stylesheets/elate/bootstrap.scss',
    'elate/main': './assets/stylesheets/elate/main.scss',
    'custom': './assets/stylesheets/custom.scss',
    'icomoon': './assets/stylesheets/icomoon.css',
  },
  output: {
    filename: 'javascripts/[name].js',
    path: path.resolve(__dirname, 'tmp/dist')
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [
          MiniCssExtractPlugin.loader,
          'css-loader'
        ]
      },
      {
        test: /\.scss$/,
        use: [
          MiniCssExtractPlugin.loader,
          'css-loader',
          'sass-loader'
        ]
      },
      {
        test: /\.(ttf|eot|svg|woff)(\?[\s\S]+)?$/,
        use: {
          loader: 'file-loader',
          options: {
            name: 'fonts/[folder]/[name]-[hash].[ext]',
            publicPath: '..'
          }
        }
      },
    ]
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: 'stylesheets/[name].css',
      chunkFilename: 'stylesheets/[id].css'
    }),
    new CleanWebpackPlugin({
      verbose: true,
      protectWebpackAssets: false,
      cleanAfterEveryBuildPatterns: [
        'javascripts/elate',
        'javascripts/custom.js',
        'javascripts/icomoon.js',
      ]
    }),
  ]
};
