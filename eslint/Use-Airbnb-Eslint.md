How to Use Airbnb Eslint
=========================

Getting the file working with SublimeLinter
-------------------------------------------
The [Airbnb Styleguide Documentation](https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb) says you can use the styleguide like this:

1. `npm install --save-dev eslint-config-airbnb eslint`
2. add `"extends": "airbnb/base"` to your .eslintrc

**Note:** The trouble with is that when you use SublimeLinter you need to have `eslint` installed globally.  You'll see an error in the SublimeLinter logs if you try to just extend the airbnb file that says it can't find the package.  That's because SublimeLinter is using a global `eslint` and the `eslint-config-airbnb` package is installed locally.  To get it to work locally you'd have to run a local `eslint`.  To get SublimeLinter to find the airbnb file you should instead run:

```bash
npm install -g eslint-config-airbnb
```

Make sure that your `eslint-config-airbnb` and `eslint` versions are both the latest or are at least compatible versions.