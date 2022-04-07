module ApplicationHelper
  def tailwind_classes_for(flash_type)
    {
      notice: "bg-green-600 text-white",
      alert: "bg-red-600 text-white"
    }.stringify_keys[flash_type.to_s] || "bg-gray-600 text-white"
  end
end
