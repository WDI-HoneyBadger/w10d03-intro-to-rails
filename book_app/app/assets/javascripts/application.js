// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery

$(document).on('turbolinks:load', () => {

  console.log("connected");
  $('.edit-comment.form').toggle()
  $('.pop-button.edit-comment').click((e) => {
    const id = $(e.target).attr("data-id");
    $(`#${id}-form`).toggle()
    $(`#${id}-info`).toggle()
  });

  const $results = $('.results').hide()
  $(".search").on("ajax:success", (e) => {
    console.log(e.detail[2].response);

    const users = JSON.parse(e.detail[2].response).users;
    $results.empty().hide()
    if (users.length) {
      $results.show()
      users.forEach(user => {
        const $container = $('<a>', {
          href: `/users/${user.id}`,
          class: 'user'
        }).appendTo($results);
        const $img = $('<img>', {
          src: user.avatar
        }).appendTo($container)
        const $name = $('<p>').text(user.name).appendTo($container)
      })
    }
  });

  $('#q').on("keyup", (e) => {
    if ($(e.target).val().length) {
      $("#submit").click();
    } else {
      $results.empty()
    }

  })
});

