const { environment } = require('@rails/webpacker')

environment.loaders.get('sass').use.splice(-1, 0, {
  loader: 'resolve-url-loader'
});

environment.module = {
    rules: [
      {
          test: /\.(png|jpg|eot|sgv|woff|ttf)$/,
          loader: "url-loader",
      },
      {        
        test: /\.(scss|css)$/,
        use: [
            "style-loader",
            "url-loader",
            "css-loader",
            "sass-loader",
        ]
	    }
    ],
    externals: {
      jquery: 'jQuery'
    }
  };
module.exports = environment;