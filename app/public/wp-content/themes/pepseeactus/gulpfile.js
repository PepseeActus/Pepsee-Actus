const fs = require('node:fs/promises');
const path = require('node:path');
const { watch, series } = require('gulp');
const sass = require('sass');

const paths = {
  styles: {
    src: 'assets/stylesheets/style.scss',
    watch: 'assets/stylesheets/**/*.scss',
    dest: './',
  },
};

function styles() {
  return sass
    .compileAsync(paths.styles.src, {
      style: 'expanded',
      sourceMap: true,
      loadPaths: [path.resolve('assets/stylesheets')],
    })
    .then(async (result) => {
      const cssOutput = path.join(paths.styles.dest, 'style.css');
      const mapOutput = `${cssOutput}.map`;
      const relativeMapPath = path.basename(mapOutput);
      const cssWithSourceMap = `${result.css}\n/*# sourceMappingURL=${relativeMapPath} */\n`;

      await fs.writeFile(cssOutput, cssWithSourceMap);

      if (result.sourceMap) {
        await fs.writeFile(mapOutput, JSON.stringify(result.sourceMap, null, 2));
      }
    });
}

function watchFiles() {
  watch(paths.styles.watch, styles);
}

exports.styles = styles;
exports.watch = watchFiles;
exports.default = series(styles, watchFiles);
