class Tag
  constructor: ( element, options ) ->
    this.element = $(element)
    this.options = $.extend(true, {}, $.fn.tag.defaults, options)
    this.values = $.grep($.map(this.element.val().split(','), $.trim),
      ( value ) ->
        value.length > 0
    )
    this.show()

  show: ->
    that = this
    that.element.parent().prepend(that.element.detach().hide())
    that.element
      .wrap($('<div class="tags">'))
      .parent()
      .on('click', () ->
        that.input.focus()
      )

    if (that.values.length)
      $.each(that.values, () ->
        that.createBadge(this)
      )

    that.input = $('<input type="text">')
      .attr('placeholder', that.options.placeholder)
      .insertAfter(that.element)
      .on('focus', () ->
        that.element.parent().addClass('tags-hover')
      )
      .on('blur',
        () ->
          if (!that.skip)
            that.process()
            that.element.parent().removeClass('tags-hover')
            that.element.siblings('.tag').removeClass('tag-important')
          that.skip = false
      )
      .on('keydown',
        ( event ) ->
          if event.keyCode is 188 or event.keyCode is 13 or event.keyCode is 9
            if $.trim($(this).val()) and ( !that.element.siblings('.typeahead').length or that.element.siblings('.typeahead').is(':hidden') )
              if ( event.keyCode isnt 9 ) event.preventDefault()
                that.process()
            else if  event.keyCode is 188
              if ( !that.element.siblings('.typeahead').length || that.element.siblings('.typeahead').is(':hidden') )
                event.preventDefault()
              else
                that.input.data('typeahead').select()
                event.stopPropagation()
                event.preventDefault()
          else if ( !$.trim($(this).val()) && event.keyCode == 8 )
            count = that.element.siblings('.tag').length
            if (count)
              tag = that.element.siblings('.tag:eq(' + (count - 1) + ')')
              if (tag.hasClass('tag-important')) that.remove(count - 1)
              else tag.addClass('tag-important')
          else
            that.element.siblings('.tag').removeClass('tag-important')

      )
      .typeahead(
        hint: true
        highlight: true
        minLength: 1
      , 
        source: that.options.source
        #matcher: ( value ) ->
        #  return ~value.toLowerCase().indexOf(this.query.toLowerCase()) && (that.inValues(value) == -1 || that.options.allowDuplicates)
      ).on('typeahead:selected', (event, suggestion, setName) ->
        that.add(suggestion.value)
      ).on('typeahead:closed', () ->
        $(that.input).val('')
      )

    #$(that.input.data('typeahead').$menu).on('mousedown', () ->
    #  that.skip = true
    #)

    this.element.trigger('shown')

  inValues: ( value ) ->
    if (this.options.caseInsensitive)
      index = -1
      $.each(this.values,  (indexInArray, valueOfElement) ->
        if valueOfElement.toLowerCase() is value.toLowerCase()
          index = indexInArray
          return false
      )
      return index
    else
      return $.inArray(value, this.values)

  createBadge: ( value ) ->
    that = this
    $('<span/>', {
      'class' : "tag"
    })
    .text(value.toString())
    .append($('<button type="button" class="close glyphicon glyphicon-remove"></button>')
      .on('click', () ->
        that.remove(that.element.siblings('.tag').index($(this).closest('.tag')))
      )
    )
    .insertBefore(that.element)
    
  add: ( value ) ->
    that = this
    if ( !that.options.allowDuplicates )
      index = that.inValues(value)
      if index isnt -1
        badge = that.element.siblings('.tag:eq(' + index + ')')
        badge.addClass('tag-warning')
        setTimeout(() ->
          $(badge).removeClass('tag-warning')
        , 500)
        return

    this.values.push(value)
    this.createBadge(value)

    this.element.val(this.values.join(', '))
    this.element.trigger('added', [value])

  remove: ( index ) ->
    if ( index >= 0 )
      value = this.values.splice(index, 1)
      this.element.siblings('.tag:eq(' + index + ')').remove()
      this.element.val(this.values.join(', '))

      this.element.trigger('removed', [value])
  process: () ->
    values = $.grep($.map(this.input.val().split(','), $.trim),
      ( value ) ->
        value.length > 0
    )
    that = this
    $.each(values, () ->
      that.add(this)
    )
    this.input.val('')

  skip: false

old = $.fn.tag

$.fn.tag = ( option ) ->
  return this.each(() -> 
    that = $(this)
    data = that.data('tag')
    options = typeof option == 'object' && option
    if (!data)
      that.data('tag', (data = new Tag(this, options)))
    if (typeof option is 'string')
      data[option]()
  )

$.fn.tag.defaults = 
  allowDuplicates: false,
  caseInsensitive: true,
  placeholder: '',
  source: []

$.fn.tag.Constructor = Tag

$.fn.tag.noConflict = () ->
  $.fn.tag = old
  return this

$(window).on('load', () -> 
  $('[data-provide="tag"]').each(() -> 
    that = $(this)
    return if (that.data('tag'))
    that.tag(that.data())
  )
)
