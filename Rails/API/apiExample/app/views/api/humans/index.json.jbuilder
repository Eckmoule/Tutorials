json.array!(@humans) do |human|
	json.extract! human, :id, :name
	json.message I18n.t("human_message", name: human.name)
end