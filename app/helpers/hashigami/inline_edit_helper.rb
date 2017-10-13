module Hashigami
  module InlineEditHelper
    module Naming
      DATA_BEHAVIOR_VALUE = 'hashigami-inline-edit'.freeze

      CSS_CLASSES = {
        root: 'hashigami-InlineEdit'.freeze,
        primary: 'hashigami-InlineEdit_Prime'.freeze,
        form: 'hashigami-InlineEdit_Option'.freeze,
      }.freeze

      def data_behavior_value
        DATA_BEHAVIOR_VALUE
      end

      def css_class_for(section)
        CSS_CLASSES[section]
      end
    end

    include Naming

    class Builder < SimpleDelegator
      include Naming

      def initialize(template, container_dom_id)
        super(template)
        @container_dom_id = container_dom_id
      end

      def primary(html_options, &block)
        section(:primary, html_options, &block)
      end

      def form(html_options, html_options, &block)
        section(:form, &block)
      end

      def section(name, html_options = {}, &block)
        html_options.merge(class: css_class_for(name))
        capture do
          content_tag(:div, html_options, &block)
        end
      end

      def link_to_toggle(name = nil, html_options = {}, &block)
        html_options.deep_merge!(
          data: {
            behavior: data_behavior_value,
            inline_edit_target: @container_dom_id
          }
        )
        capture do
          link_to(name, '#', html_options, &block)
        end
      end
    end

    def inline_edit_with(container_dom_id, &block)
      builder = Builder.new(self, container_dom_id)
      output = capture(builder, &block)
      content_tag(:div, id: container_dom_id, class: css_class_for(:root)) do
        concat output
      end
    end
  end
end
