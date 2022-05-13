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
    },
    org = {
      org_toggle_checkbox = {';x', '<S-x>'},
      org_open_at_point = {'<cr>', '<leader>oo'},
      org_insert_heading_respect_content = {';h', '<leader>oih'},
      org_meta_return = {';n', '<leader><cr>'},
      org_toggle_archive_tag = ';a',
      org_archive_subtree = ';$',
      org_todo = ';c',
      org_priority_up = '+',
      org_priority_down = '-',
      org_change_date = ';cd',
      org_deadline = ';dd',
      org_schedule = ';ds',
      org_time_stamp = ';dt',
      org_clock_in = ';ci',
      org_clock_out = ';co',
      org_clock_goto = ';cg',
      org_set_effort = ';e',
    }
  }
}
