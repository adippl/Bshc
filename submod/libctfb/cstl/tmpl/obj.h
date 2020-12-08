#ifdef T
	CAT(obj,T)* (*init)();
	CAT(obj,T)* (*finalize)();
	void (*free)(struct CAT(obj,T)* p_struct);
	CAT(obj,T)* (*copy)(CAT(obj,T)* p_struct);
	CAT(obj,T)* (*copyDeep)(CAT(obj,T)* p_struct);
	size_t objSize;
	uint16_t objName;
#endif
