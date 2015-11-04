```JavaScript
function makePromise (data) {
  var dfd = $.Deferred();
  var timeout = ((Math.random() * 2501) + 1000)|0;
  
  window.setTimeout(() => {
    dfd.resolve(data);
  }, timeout);
  
  return dfd.promise();
}


function failPromise (data) {
  var dfd = $.Deferred();
  var timeout = ((Math.random() * 2501) + 1000)|0;
  
  window.setTimeout(() => {
    dfd.reject(data);
  }, timeout);
  
  return dfd.promise();
}

// Thens will go in order
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

// Failing a promise will break the chain
makePromise('hello')
.then(d => {
  console.log(d);
  return makePromise('world');
})
.then(d => {
  console.log(d);
  return failPromise('foo');
})
.then(d => {
  console.log(d);
  return makePromise('bar');
})
.then(d => {
  console.log(d);
  return makePromise('baz');
})
.done(d => console.log(d));

// You can handle a break in the chain
// with a rejection handler in 'then'
makePromise('hello')
.then(d => {
  console.log(d);
  return makePromise('world');
})
.then(d => {
  console.log(d);
  return failPromise('foo');
})
.then(d => {
  console.log(d);
  return makePromise('bar');
}, err => {
  console.log(err);
})
.then(d => {
  console.log(d);
  return makePromise('baz');
})
.done(d => console.log(d));

// You can keep the chain going by resolving a
// a promise in the 'then' rejection handler
makePromise('hello')
.then(d => {
  console.log(d);
  return makePromise('world');
})
.then(d => {
  console.log(d);
  return failPromise('foo');
})
.then(d => {
  console.log(d);
  return makePromise('bar');
}, err => {
  console.log(err);
  return makePromise('gah');
})
.then(d => {
  console.log(d);
  return makePromise('baz');
})
.done(d => console.log(d));
```