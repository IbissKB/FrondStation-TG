/// gives us the stack trace from CRASH() without ending the current proc.
/// Do not call directly, use the [stack_trace] macro instead.
/proc/_stack_trace(message, file, line)
	CRASH("[message] ([file]:[line])")
<<<<<<< HEAD

GLOBAL_REAL_VAR(list/stack_trace_storage)
/proc/gib_stack_trace()
	stack_trace_storage = list()
	stack_trace("")
	stack_trace_storage.Cut(1, min(3,stack_trace_storage.len))
	. = stack_trace_storage
	stack_trace_storage = null
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
