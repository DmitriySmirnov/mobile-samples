require 'calabash-cucumber/ibase'

class TaskDetailsScreen < Calabash::IBase
  include TaskyPro::IOSHelpers

  def name_field
    "textField placeholder:'task name'"
  end

  def notes_field
    "textField placeholder:'other task info'"
  end

  def cancel_button
    "label marked:'Delete'"
  end

  def save_button
    "label marked:'Save'"
  end

  def trait
    "label text:'Task Details'"
  end

  def done_checkbox
    "switch"
  end

  def enter_new_task(new_task)
    enter_text(name_field, new_task[:name])
    enter_text(notes_field, new_task[:notes])
  end

  def add_new_task(new_task)

    enter_new_task(new_task)
    touch(save_button)
    page(TaskyProScreen).await

  end

  def mark_as_done
    touch(done_checkbox)
  end

  def is_done?
    query_results = query(query("switch", "isOn"))
    return query_results[0] == "1"
  end

  def tap_cancel_button
    touch(cancel_button)
  end
end