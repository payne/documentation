```JavaScript
function makePromise (data) {
  let dfd = $.Deferred();
  const timeout = ((Math.random() * 2501) + 1000)|0;
  
  window.setTimeout(() => {
    dfd.resolve(data);
  }, timeout);
  
  return dfd.promise();
}


function failPromise (data) {
  let dfd = $.Deferred();
  const timeout = ((Math.random() * 2501) + 1000)|0;
  
  window.setTimeout(() => {
    dfd.reject(data);
  }, timeout);
  
  return dfd.promise();
}

makePromise('hello')
.then(d => {
  console.log(d);
  return makePromise('world');
})
.then(d => {
  console.log(d);
  return makePromise('foo');
})
.then(d => console.log(d))
.then(d => {
  console.log(d);
  return makePromise('bar');
})
.then(d => {
  console.log(d);
  return makePromise('baz');
})
.done(d => console.log(d));
```