
const fs     = require('fs')
const html   = require('html')
const marked = require('marked')

function main(){
  
  const md_file_name = process.argv[2]
  
  const cntnt_md = fs.readFileSync(md_file_name, {encoding:'utf-8'})
  
  const cntnt_html = marked.parse(cntnt_md)
  
  const cntnt_out = html.prettyPrint(cntnt_html)
  
  const out_file_name = md_file_name + ".html"
  
  fs.writeFileSync(out_file_name, cntnt_out, "utf-8")
}

main()

