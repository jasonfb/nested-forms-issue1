

see https://stackoverflow.com/questions/61129043/rails-6-0-2-2-form-with-using-a-nested-partial-renders-the-form-contents-outside?noredirect=1#comment108154586_61129043


to test, run in Ruby 2.6.4 and 
`bundle exec rails server`

then go to 

http://127.0.0.1:3000/things



STEPS TO REPRODUCE:
1) Create a "Thing" you will see a fancy animation opening an in-page create form
(sorry the page reloads here but you should see your newly created thing)


2) Click "Edit"

3) Open Chrome inspector


4) Notice that there is a form element which closes immediatley after it opens

```

<form class="edit_thing" id="edit_thing_5" action="/things/5" accept-charset="UTF-8" data-remote="true" method="post"></form>

```

then BELOW this (not within it) appears the form content

```
<input type="hidden" name="_method" value="patch">
<input type="text" value="helllo" name="thing[name]" id="thing_name">
<label>
Name
</label>
<br>
<input type="text" value="red" name="thing[color]" id="thing_color">
<label>
Color
</label>
<input type="submit" name="commit" value="Save" class="btn btn-primary" data-disable-with="Save">
```


5) You will notice that the "Save" button does nothing when you click it, because of course it is not inside the form like it is supposed to be



Please note that this happens on a BRAND NEW RAILS 6.0.2.2 app

For some reason the NEW form renders as expected (see code), this only happens with an EDIT action when rendering through
javascript and ERB


If I render as html, then the nested form renders as-expected

EXPECTED RESULTS:
- the nested input elements render WITHIN the form, not after it. 
