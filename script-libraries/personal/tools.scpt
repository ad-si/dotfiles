JsOsaDAS1.001.00bplist00�Vscript_�function say (input) {
  const app = Application.currentApplication()
  app.includeStandardAdditions = true
  app.say(input)
}

function writeFile (fileContent, filePath) {
  const fileString = $.NSString.alloc.initWithUTF8String(fileContent)
	const filePathNorm = $(filePath).stringByStandardizingPath
	const encoding = $.NSUTF8StringEncoding
  let error = $()

	fileString.writeToFileAtomicallyEncodingError(
  	filePathNorm,
  	true,
  	encoding,
	  error
	)

  if (error) {
    console.log(error)
  }
}

function createDirectory (path) {
	const fileManager = $.NSFileManager.defaultManager
  let error = $()

  fileManager.createDirectoryAtPathWithIntermediateDirectoriesAttributesError(
    $(path).stringByStandardizingPath,
    true,
    $(),
    error
  )
  
  if (error) {
    console.log(error)
  }
}


const spacing = '  '

function getType (obj) {
  if (Array.isArray(obj)) return 'array'
  else if (typeof obj === 'undefined' || obj === null) return 'null'
  else return typeof obj
}

function convert (obj, ret) {
  const type = getType(obj)

  switch (type) {
    case 'array':
      convertArray(obj, ret)
      break
    case 'object':
      convertHash(obj, ret)
      break
    case 'string':
      convertString(obj, ret)
      break
    case 'null':
      ret.push('null')
      break
    case 'number':
      ret.push(obj.toString())
      break
    case 'boolean':
      ret.push(obj ? 'true' : 'false')
      break
    default:
      throw new TypeError(`${type} is no supported type`)
  }
}

function convertArray (obj, ret) {
  for (let index = 0; index < obj.length; index++) {
    const ele = obj[index]
    const recurse = []
    convert(ele, recurse)

    for (let subIndex = 0; subIndex < recurse.length; subIndex++) {
      ret.push((subIndex === 0 ? '- ' : spacing) + recurse[subIndex])
    }
  }
}

function convertHash (obj, ret) {
  for (const key in obj) {
    if (!obj.hasOwnProperty(key)) return
    const recurse = []
    if (obj.hasOwnProperty(key)) {
      const ele = obj[key]
      convert(ele, recurse)
      const type = getType(ele)
      if (
        type === 'string' ||
        type === 'null' ||
        type === 'number' ||
        type === 'boolean'
      ) {
        ret.push(normalizeString(key) + ': ' +  recurse[0])
      }
      else {
        ret.push(normalizeString(key) + ': ')
        for (let index = 0; index < recurse.length; index++) {
          ret.push(spacing + recurse[index])
        }
      }
    }
  }
}

function normalizeString (str) {
  return str
}

function convertString (obj, ret) {
  ret.push(normalizeString(obj))
}

function json2yaml (obj) {
  if (typeof obj === 'string') {
    obj = JSON.parse(obj)
  }

  const ret = []
  convert(obj, ret)
  return ret.join('\n') + '\n'
}

function getDateFileName (options = {}) {
  const {
    fileExtension = 'yaml'
  } = options

  const dateTime = new Date()
    .toISOString()
    .replace(
      /T(\d{2}):(\d{2}):\d{2}.\d{3}Z$/i,
      'T$1$2'
    )
  return `${dateTime}.${fileExtension}`
}                              � jscr  ��ޭ