#ifdef T
	CAT(obj,T)* (*init)();
	CAT(obj,T)* (*finalize)();
	void (*free)(CAT(obj,T)* this);
	void (*clean)(CAT(obj,T)* this);
	CAT(obj,T)* (*copy)(CAT(obj,T)* this);
	CAT(obj,T)* (*copyTo)(CAT(obj,T)* this);
	size_t objSize;
	uint16_t objName;
#endif
