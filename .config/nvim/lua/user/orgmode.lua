local status_ok, orgmode = pcall(require, "orgmode")
if not status_ok then
  return
end

orgmode.setup {
  org_agenda_files = {'~/workspace/src/github.com/deptno/org/*'},
  org_default_notes_file = '~/workspace/src/github.com/deptno/org/refile.org',
  mappings = {
    global = {
      org_agenda = {'<space>oa', '<leader>oa'},
      org_capture = {'<space>oc', '<leader>oc'},
    }
  }
}
