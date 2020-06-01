#!/usr/bin/env node

var fs = require('fs');
var args = process.argv.splice(2);
var replaceToken = [
  "2015",
  "2016",
  "1080p",
  "720p",
  "BluRay",
  "x264",
  "-[YTS AG]"
  ];

for (var i = args.length - 1; i >= 0; i--) {
  var v = args[i];
  var fn = getFileName(v);
  var ext = getExtention(v);
  var newName = getNewName(fn) + ext;
  console.log(newName);
  // fs.renameSync(v, newName);
}

function getFileName(fileName) {
  var ext = getExtention(fileName);
  var name = fileName.substring(0, fileName.length-ext.length);
  return name.toString();
}
function getExtention(fileName) {
  var name = fileName.split('.');
  var ext = name.splice(-1, 1).toString();
  return "." + ext;
}
getNewName(fileName) => {
  var newName = fileName.replace(/\./g, ' ');
  replaceToken.forEach(function (el) {
    newName = newName.replace(el,'');
  })
  return newName.trimRight();
}
// fs.renameSync()
