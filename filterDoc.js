#!/usr/bin/env node
const fs = require('fs')

let json = "";
process.stdin.resume();
process.stdin.setEncoding('utf8');

process.stdin.on('data', (chunk) => { json += chunk })
process.stdin.on('end', () => { filter(json) })


// const analysis = require('./test/analysis.json')

/**
 * Filter methods that are inherited from Polymer
 * @param {array} methods 
 */
function filterInherited(methods) {
  return methods.filter((method) => {
    if(!method.inheritedFrom || !method.inheritedFrom.startsWith('Polymer')) {
      return method;
    }
  })
}

function filter(json) {
  const analysis = JSON.parse(json);
  const result = {}

  if(!analysis.elements) {
    return console.log(JSON.stringify(analysis,'',2));
  }

  Object.keys(analysis).forEach( key => {
    if(key === 'elements') { 
      result.elements = []
    } else {
      result[key] = analysis[key]
    }
  })

  result.elements = analysis.elements.map( element => {
    element.methods = filterInherited(element.methods)
    element.staticMethods = filterInherited(element.staticMethods)
    return element
  })

  console.log(JSON.stringify(result,'',2));
}

