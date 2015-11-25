# releases
Uses GitHub API to show feed of releases for a given project

## Preview 

![Preview Image](https://levlaz.org/wp-content/uploads/2015/11/Screenshot-2015-11-24-19.47.48.png)

## Usage

Add the following HTML to the page where you want the releases to be displayed.

```
<div class="container">
  <ul id="releases">
  </ul>
  <p id="more-releases">
  </p>
</div>
```

Load the following scripts on the same page as where you put the code above. (*note* if you are using Bootstrap you probably are already loading jQuery)

```
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="js/marked.js"></script>
<script src="js/moment.js"></script>
<script src="js/releases.js"></script>
```

Add the Styles from style.css to your existing stylesheet.

```
/* Style for Releases Plugin */
#releases {
  list-style-type: none;
}

a.release-title {
  text-decoration: none;
  color: #0066cc;
}

a.release-title:hover {
  color:#0099ff;
}

.release-body a{
  text-decoration: none;
  color: #0066cc;
}

.release-body a:hover{
  text-decoration: none;
  color: #0099ff;
}
```

Update the `window.repo` variable on [Line 5](https://github.com/levlaz/releases/blob/master/js/releases.js#L5) of `releases.js` to be whatever repo you want to display releases for.
