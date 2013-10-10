Handles the notcompute condition in overcloud-source.yaml.

Including notcompute causes the handle completion-handle to be signaled from
postconfigure.d/99-refresh-completed.

The completion-handle comes from Heat Metadata e.g.
Metadata:
  completion-handle: {Ref: StackCompleteHandle}
