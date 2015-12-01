# GitHub URL that you wish to get the releases for
window.repo = 'https://github.com/levlaz/braindump'

marked.setOptions({
  renderer: new marked.Renderer(),
  gfm: true,
  tables: true,
  breaks: false,
  pedantic: false,
  sanitize: true,
  smartLists: true,
  smartypants: false
});

getReleaseUrl = (repo) ->
  url = repo.split('/')
  api_url = "https://api.github.com/repos/#{url[3]}/#{url[4]}/releases"
  console.log(api_url)
  return api_url

getBugsUrl = (repo) ->
  url = repo.split('/')
  bug_url = "https://api.github.com/repos/#{url[3]}/#{url[4]}/issues?labels=bug"
  console.log(bug_url)
  return bug_url

getReleases = (api_url) ->
    $.ajax api_url,
        type: 'GET'
        dataType: 'json'
        error: (jqXHR, textStatus, errorThrown) ->
          console.log "AJAX Error: #{textStatus}"
        success: (data, textStatus, jqXHR) ->
          for release in jqXHR.responseJSON
            $('#releases').append "<li class='release'>" +
              "<a class='release-title' href='#{release.html_url}'><h2>#{release.name}</h2></a>" +
                "<h3>#{moment(release.published_at).format('MMMM Do YYYY')}</h3>" +
                "<div class='release-body'>#{marked(release.body)}</div>" +
              "</li>"

getBugs = (bug_url) ->
  $.ajax bug_url,
    type: 'GET'
    dataType: 'json'
    error: (jqXHR, textStatus, errorThrown) ->
      console.log "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
      for bug in jqXHR.responseJSON
        $('#bugs').append "<li class='bug'>" +
          "<a class='bug-title' href='#{bug.html_url}'><h5>#{bug.title}</h5></a></li>"

getReleases(getReleaseUrl(repo))
console.log("Getting Bugs")
getBugs(getBugsUrl(repo))

$('#more-releases').append "<a href='#{repo}/releases'><button>View More Releases </button></a>"
