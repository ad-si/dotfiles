# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to make opened Markdown files always be soft wrapped:
#
# path = require 'path'
#
# atom.workspaceView.eachEditorView (editorView) ->
#   editor = editorView.getEditor()
#   if path.extname(editor.getPath()) is '.md'
#     editor.setSoftWrap(true)


# Yesterday
atom.commands.add 'atom-text-editor', 'custom:yesterday', ->
  if editor = atom.workspace.getActiveTextEditor()
    minusADay = new Date()
    minusADay.setDate(minusADay.getDate() - 1)

    yesterday = minusADay
      .toISOString()
      .split('T')[0]

    editor.insertText(yesterday)

# Today
atom.commands.add 'atom-text-editor', 'custom:today', ->
  if editor = atom.workspace.getActiveTextEditor()
    today = new Date()
      .toISOString()
      .split('T')[0]

    editor.insertText(today)

# Now
atom.commands.add 'atom-text-editor', 'custom:now', ->
  if editor = atom.workspace.getActiveTextEditor()
    now = new Date()
      .toISOString()
      .replace(/.\d{3}Z$/, '')
      .replace('T', ' ')

    editor.insertText(now)

# Tomorrow
atom.commands.add 'atom-text-editor', 'custom:tomorrow', ->
  if editor = atom.workspace.getActiveTextEditor()
    plusADay = new Date()
    plusADay.setDate(plusADay.getDate() + 1)

    tomorrow = plusADay
      .toISOString()
      .split('T')[0]

    editor.insertText(tomorrow)


# To UTC
chrono = require 'chrono-node'
assert = require 'assert'
atom.commands.add 'atom-text-editor', 'custom:to UTC', ->
  editor = atom.workspace.getActiveTextEditor()
  assert(editor, 'Could not get active editor')

  selection = editor.getLastSelection()
  assert(selection, 'Could not get last selection')

  asUtc = chrono.parseDate(selection.getText())
  assert(asUtc, 'Could not parse date')

  isoString = asUtc.toISOString()
  assert(isoString, 'Could not convert date to ISO string')

  isoBeautified = isoString
    .replace('T', ' ')
    .replace(/\.\d{3}Z$/, '')
  assert(isoBeautified, 'Could not beautify ISO string')

  editor.insertText(isoBeautified)
