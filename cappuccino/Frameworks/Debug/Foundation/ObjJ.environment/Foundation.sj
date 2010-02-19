@STATIC;1.0;p;13;CPArray+KVO.jt;16133;@STATIC;1.0;i;9;CPArray.ji;8;CPNull.jt;16088;objj_executeFile("CPArray.j", true);
objj_executeFile("CPNull.j", true);
{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("mutableArrayValueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
 return objj_msgSend(objj_msgSend(_CPKVCArray, "alloc"), "initWithKey:forProxyObject:", aKey, self);
}
}), new objj_method(sel_getUid("mutableArrayValueForKeyPath:"), function(self, _cmd, aKeyPath)
{ with(self)
{
    var dotIndex = aKeyPath.indexOf(".");
    if (dotIndex < 0)
        return objj_msgSend(self, "mutableArrayValueForKey:", aKeyPath);
    var firstPart = aKeyPath.substring(0, dotIndex),
        lastPart = aKeyPath.substring(dotIndex+1);
    return objj_msgSend(objj_msgSend(self, "valueForKeyPath:", firstPart), "valueForKeyPath:", lastPart);
}
})]);
}
{var the_class = objj_allocateClassPair(CPArray, "_CPKVCArray"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_proxyObject"), new objj_ivar("_key"), new objj_ivar("_insertSEL"), new objj_ivar("_insert"), new objj_ivar("_removeSEL"), new objj_ivar("_remove"), new objj_ivar("_replaceSEL"), new objj_ivar("_replace"), new objj_ivar("_insertManySEL"), new objj_ivar("_insertMany"), new objj_ivar("_removeManySEL"), new objj_ivar("_removeMany"), new objj_ivar("_replaceManySEL"), new objj_ivar("_replaceMany"), new objj_ivar("_objectAtIndexSEL"), new objj_ivar("_objectAtIndex"), new objj_ivar("_countSEL"), new objj_ivar("_count"), new objj_ivar("_accessSEL"), new objj_ivar("_access"), new objj_ivar("_setSEL"), new objj_ivar("_set")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithKey:forProxyObject:"), function(self, _cmd, aKey, anObject)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPKVCArray").super_class }, "init");
    _key = aKey;
    _proxyObject = anObject;
    var capitalizedKey = _key.charAt(0).toUpperCase() + _key.substring(1);
    _insertSEL = sel_getName("insertObject:in"+capitalizedKey+"AtIndex:");
    if (objj_msgSend(_proxyObject, "respondsToSelector:", _insertSEL))
        _insert = objj_msgSend(_proxyObject, "methodForSelector:", _insertSEL);
    _removeSEL = sel_getName("removeObjectFrom"+capitalizedKey+"AtIndex:");
    if (objj_msgSend(_proxyObject, "respondsToSelector:", _removeSEL))
        _remove = objj_msgSend(_proxyObject, "methodForSelector:", _removeSEL);
    _replaceSEL = sel_getName("replaceObjectFrom"+capitalizedKey+"AtIndex:withObject:");
    if (objj_msgSend(_proxyObject, "respondsToSelector:", _replaceSEL))
        _replace = objj_msgSend(_proxyObject, "methodForSelector:", _replaceSEL);
    _insertManySEL = sel_getName("insertObjects:in"+capitalizedKey+"AtIndexes:");
    if (objj_msgSend(_proxyObject, "respondsToSelector:", _insertManySEL))
        _insert = objj_msgSend(_proxyObject, "methodForSelector:", _insertManySEL);
    _removeManySEL = sel_getName("removeObjectsFrom"+capitalizedKey+"AtIndexes:");
    if (objj_msgSend(_proxyObject, "respondsToSelector:", _removeManySEL))
        _remove = objj_msgSend(_proxyObject, "methodForSelector:", _removeManySEL);
    _replaceManySEL = sel_getName("replaceObjectsFrom"+capitalizedKey+"AtIndexes:withObjects:");
    if (objj_msgSend(_proxyObject, "respondsToSelector:", _replaceManySEL))
        _replace = objj_msgSend(_proxyObject, "methodForSelector:", _replaceManySEL);
    _objectAtIndexSEL = sel_getName("objectIn"+capitalizedKey+"AtIndex:");
    if (objj_msgSend(_proxyObject, "respondsToSelector:", _objectAtIndexSEL))
        _objectAtIndex = objj_msgSend(_proxyObject, "methodForSelector:", _objectAtIndexSEL);
    _countSEL = sel_getName("countOf"+capitalizedKey);
    if (objj_msgSend(_proxyObject, "respondsToSelector:", _countSEL))
        _count = objj_msgSend(_proxyObject, "methodForSelector:", _countSEL);
    _accessSEL = sel_getName(_key);
    if (objj_msgSend(_proxyObject, "respondsToSelector:", _accessSEL))
        _access = objj_msgSend(_proxyObject, "methodForSelector:", _accessSEL);
    _setSEL = sel_getName("set"+capitalizedKey+":");
    if (objj_msgSend(_proxyObject, "respondsToSelector:", _setSEL))
        _set = objj_msgSend(_proxyObject, "methodForSelector:", _setSEL);
    return self;
}
}), new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    var theCopy = [],
        count = objj_msgSend(self, "count");
    for (var i=0; i<count; i++)
        objj_msgSend(theCopy, "addObject:", objj_msgSend(self, "objectAtIndex:", i));
    return theCopy;
}
}), new objj_method(sel_getUid("_representedObject"), function(self, _cmd)
{ with(self)
{
    if (_access)
        return _access(_proxyObject, _accessSEL);
    return objj_msgSend(_proxyObject, "valueForKey:", _key);
}
}), new objj_method(sel_getUid("_setRepresentedObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (_set)
        return _set(_proxyObject, _setSEL, anObject);
    objj_msgSend(_proxyObject, "setValue:forKey:", anObject, _key);
}
}), new objj_method(sel_getUid("count"), function(self, _cmd)
{ with(self)
{
    if (_count)
        return _count(_proxyObject, _countSEL);
    return objj_msgSend(objj_msgSend(self, "_representedObject"), "count");
}
}), new objj_method(sel_getUid("indexOfObject:inRange:"), function(self, _cmd, anObject, aRange)
{ with(self)
{
    var index = aRange.location,
        count = aRange.length,
        shouldIsEqual = !!anObject.isa;
    for (; index < count; ++index)
    {
        var object = objj_msgSend(self, "objectAtIndex:", index);
        if (anObject === object || shouldIsEqual && !!object.isa && objj_msgSend(anObject, "isEqual:", object))
            return index;
    }
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfObject:"), function(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(self, "indexOfObject:range:", anObject, CPMakeRange(0, objj_msgSend(self, "count")));
}
}), new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"), function(self, _cmd, anObject, aRange)
{ with(self)
{
    var index = aRange.location,
        count = aRange.length;
    for (; index < count; ++index)
        if (anObject === objj_msgSend(self, "objectAtIndex:", index))
            return index;
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfObjectIdenticalTo:"), function(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(self, "indexOfObjectIdenticalTo:inRange:", anObject, CPMakeRange(0, objj_msgSend(self, "count")));
}
}), new objj_method(sel_getUid("objectAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    if(_objectAtIndex)
        return _objectAtIndex(_proxyObject, _objectAtIndexSEL, anIndex);
    return objj_msgSend(objj_msgSend(self, "_representedObject"), "objectAtIndex:", anIndex);
}
}), new objj_method(sel_getUid("addObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (_insert)
        return _insert(_proxyObject, _insertSEL, anObject, objj_msgSend(self, "count"));
    var target = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
    objj_msgSend(target, "addObject:", anObject);
    objj_msgSend(self, "_setRepresentedObject:", target);
}
}), new objj_method(sel_getUid("addObjectsFromArray:"), function(self, _cmd, anArray)
{ with(self)
{
    var index = 0,
        count = objj_msgSend(anArray, "count");
    for (; index < count; ++index)
        objj_msgSend(self, "addObject:", objj_msgSend(anArray, "objectAtIndex:", index));
}
}), new objj_method(sel_getUid("insertObject:atIndex:"), function(self, _cmd, anObject, anIndex)
{ with(self)
{
    if (_insert)
        return _insert(_proxyObject, _insertSEL, anObject, anIndex);
    var target = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
    objj_msgSend(target, "insertObject:atIndex:", anObject, anIndex);
    objj_msgSend(self, "_setRepresentedObject:", target);
}
}), new objj_method(sel_getUid("removeLastObject"), function(self, _cmd)
{ with(self)
{
    if(_remove)
        return _remove(_proxyObject, _removeSEL, objj_msgSend(self, "count")-1);
    var target = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
    objj_msgSend(target, "removeLastObject");
    objj_msgSend(self, "_setRepresentedObject:", target);
}
}), new objj_method(sel_getUid("removeObjectAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    if(_remove)
        return _remove(_proxyObject, _removeSEL, anIndex);
    var target = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
    objj_msgSend(target, "removeObjectAtIndex:", anIndex);
    objj_msgSend(self, "_setRepresentedObject:", target);
}
}), new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"), function(self, _cmd, anIndex, anObject)
{ with(self)
{
    if(_replace)
        return _replace(_proxyObject, _replaceSEL, anIndex, anObject);
    var target = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
    objj_msgSend(target, "replaceObjectAtIndex:withObject:", anIndex, anObject);
    objj_msgSend(self, "_setRepresentedObject:", target);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    var array = [];
    array.isa = self;
    var ivars = class_copyIvarList(self),
        count = ivars.length;
    while (count--)
        array[ivar_getName(ivars[count])] = nil;
    return array;
}
})]);
}
{
var the_class = objj_getClass("CPArray")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("valueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    if (aKey.indexOf("@") === 0)
    {
        if (aKey.indexOf(".") !== -1)
            objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "called valueForKey: on an array with a complex key ("+aKey+"). use valueForKeyPath:");
        if (aKey == "@count")
            return length;
        return nil;
    }
    else
    {
        var newArray = [],
            enumerator = objj_msgSend(self, "objectEnumerator"),
            object;
        while ((object = objj_msgSend(enumerator, "nextObject")) !== nil)
        {
            var value = objj_msgSend(object, "valueForKey:", aKey);
            if (value === nil || value === undefined)
                value = objj_msgSend(CPNull, "null");
            newArray.push(value);
        }
        return newArray;
    }
}
}), new objj_method(sel_getUid("valueForKeyPath:"), function(self, _cmd, aKeyPath)
{ with(self)
{
    if (aKeyPath.indexOf("@") === 0)
    {
        var dotIndex = aKeyPath.indexOf("."),
            operator,
            parameter;
        if (dotIndex !== -1)
        {
            operator = aKeyPath.substring(1, dotIndex);
            parameter = aKeyPath.substring(dotIndex+1);
        }
        else
            operator = aKeyPath.substring(1);
        if (kvoOperators[operator])
            return kvoOperators[operator](self, _cmd, parameter);
        return nil;
    }
    else
    {
        var newArray = [],
            enumerator = objj_msgSend(self, "objectEnumerator"),
            object;
        while ((object = objj_msgSend(enumerator, "nextObject")) !== nil)
        {
            var value = objj_msgSend(object, "valueForKeyPath:", aKeyPath);
            if (value === nil || value === undefined)
                value = objj_msgSend(CPNull, "null");
            newArray.push(value);
        }
        return newArray;
    }
}
}), new objj_method(sel_getUid("setValue:forKey:"), function(self, _cmd, aValue, aKey)
{ with(self)
{
    var enumerator = objj_msgSend(self, "objectEnumerator"),
        object;
    while (object = objj_msgSend(enumerator, "nextObject"))
        objj_msgSend(object, "setValue:forKey:", aValue, aKey);
}
}), new objj_method(sel_getUid("setValue:forKeyPath:"), function(self, _cmd, aValue, aKeyPath)
{ with(self)
{
    var enumerator = objj_msgSend(self, "objectEnumerator"),
        object;
    while (object = objj_msgSend(enumerator, "nextObject"))
        objj_msgSend(object, "setValue:forKeyPath:", aValue, aKeyPath);
}
})]);
}
var kvoOperators = [];
var avgOperator, maxOperator, minOperator, countOperator, sumOperator;
kvoOperators["avg"] = avgOperator= function(self, _cmd, param)
{
    var objects = objj_msgSend(self, "valueForKeyPath:", param),
        length = objj_msgSend(objects, "count"),
        index = length;
        average = 0.0;
    if (!length)
        return 0;
    while(index--)
        average += objj_msgSend(objects[index], "doubleValue");
    return average / length;
}
kvoOperators["max"] = maxOperator= function(self, _cmd, param)
{
    var objects = objj_msgSend(self, "valueForKeyPath:", param),
        index = objj_msgSend(objects, "count") - 1,
        max = objj_msgSend(objects, "lastObject");
    while (index--)
    {
        var item = objects[index];
        if (objj_msgSend(max, "compare:", item) < 0)
            max = item;
    }
    return max;
}
kvoOperators["min"] = minOperator= function(self, _cmd, param)
{
    var objects = objj_msgSend(self, "valueForKeyPath:", param),
        index = objj_msgSend(objects, "count") - 1,
        min = objj_msgSend(objects, "lastObject");
    while (index--)
    {
        var item = objects[index];
        if (objj_msgSend(min, "compare:", item) > 0)
            min = item;
    }
    return min;
}
kvoOperators["count"] = countOperator= function(self, _cmd, param)
{
    return objj_msgSend(self, "count");
}
kvoOperators["sum"] = sumOperator= function(self, _cmd, param)
{
    var objects = objj_msgSend(self, "valueForKeyPath:", param),
        index = objj_msgSend(objects, "count"),
        sum = 0.0;
    while(index--)
        sum += objj_msgSend(objects[index], "doubleValue");
    return sum;
}
{
var the_class = objj_getClass("CPArray")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("addObserver:toObjectsAtIndexes:forKeyPath:options:context:"), function(self, _cmd, anObserver, indexes, aKeyPath, options, context)
{ with(self)
{
    var index = objj_msgSend(indexes, "firstIndex");
    while (index >= 0)
    {
        objj_msgSend(self[index], "addObserver:forKeyPath:options:context:", anObserver, aKeyPath, options, context);
        index = objj_msgSend(indexes, "indexGreaterThanIndex:", index);
    }
}
}), new objj_method(sel_getUid("removeObserver:fromObjectsAtIndexes:forKeyPath:"), function(self, _cmd, anObserver, indexes, aKeyPath)
{ with(self)
{
    var index = objj_msgSend(indexes, "firstIndex");
    while (index >= 0)
    {
        objj_msgSend(self[index], "removeObserver:forKeyPath:", anObserver, aKeyPath);
        index = objj_msgSend(indexes, "indexGreaterThanIndex:", index);
    }
}
}), new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"), function(self, _cmd, observer, aKeyPath, options, context)
{ with(self)
{
    if (objj_msgSend(isa, "instanceMethodForSelector:", _cmd) === objj_msgSend(CPArray, "instanceMethodForSelector:", _cmd))
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Unsupported method on CPArray");
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPArray").super_class }, "addObserver:forKeyPath:options:context:", observer, aKeyPath, options, context);
}
}), new objj_method(sel_getUid("removeObserver:forKeyPath:"), function(self, _cmd, observer, aKeyPath)
{ with(self)
{
    if (objj_msgSend(isa, "instanceMethodForSelector:", _cmd) === objj_msgSend(CPArray, "instanceMethodForSelector:", _cmd))
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Unsupported method on CPArray");
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPArray").super_class }, "removeObserver:forKeyPath:", observer, aKeyPath);
}
})]);
}

p;9;CPArray.jt;24882;@STATIC;1.0;i;10;CPObject.ji;9;CPRange.ji;14;CPEnumerator.ji;18;CPSortDescriptor.ji;13;CPException.jt;24774;objj_executeFile("CPObject.j", true);
objj_executeFile("CPRange.j", true);
objj_executeFile("CPEnumerator.j", true);
objj_executeFile("CPSortDescriptor.j", true);
objj_executeFile("CPException.j", true);
{var the_class = objj_allocateClassPair(CPEnumerator, "_CPArrayEnumerator"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_array"), new objj_ivar("_index")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithArray:"), function(self, _cmd, anArray)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPArrayEnumerator").super_class }, "init");
    if (self)
    {
        _array = anArray;
        _index = -1;
    }
    return self;
}
}), new objj_method(sel_getUid("nextObject"), function(self, _cmd)
{ with(self)
{
    if (++_index >= objj_msgSend(_array, "count"))
        return nil;
    return objj_msgSend(_array, "objectAtIndex:", _index);
}
}), new objj_method(sel_getUid("countByEnumeratingWithState:objects:count:"), function(self, _cmd, aState, objects, aCount)
{ with(self)
{
    return objj_msgSend(_array, "countByEnumeratingWithState:objects:count:", aState, objects, aCount);
}
})]);
}
{var the_class = objj_allocateClassPair(CPEnumerator, "_CPReverseArrayEnumerator"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_array"), new objj_ivar("_index")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithArray:"), function(self, _cmd, anArray)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPReverseArrayEnumerator").super_class }, "init");
    if (self)
    {
        _array = anArray;
        _index = objj_msgSend(_array, "count");
    }
    return self;
}
}), new objj_method(sel_getUid("nextObject"), function(self, _cmd)
{ with(self)
{
    if (--_index < 0)
        return nil;
    return objj_msgSend(_array, "objectAtIndex:", _index);
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "CPArray"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("initWithArray:"), function(self, _cmd, anArray)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPArray").super_class }, "init");
    if (self)
        objj_msgSend(self, "setArray:", anArray);
    return self;
}
}), new objj_method(sel_getUid("initWithArray:copyItems:"), function(self, _cmd, anArray, copyItems)
{ with(self)
{
    if (!copyItems)
        return objj_msgSend(self, "initWithArray:", anArray);
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPArray").super_class }, "init");
    if (self)
    {
        var index = 0,
            count = objj_msgSend(anArray, "count");
        for(; index < count; ++i)
        {
            if (anArray[i].isa)
                self[i] = objj_msgSend(anArray, "copy");
            else
                self[i] = anArray;
        }
    }
    return self;
}
}), new objj_method(sel_getUid("initWithObjects:"), function(self, _cmd, anArray)
{ with(self)
{
    var i = 2,
        argument;
    for(; i < arguments.length && (argument = arguments[i]) != nil; ++i)
        push(argument);
    return self;
}
}), new objj_method(sel_getUid("initWithObjects:count:"), function(self, _cmd, objects, aCount)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPArray").super_class }, "init");
    if (self)
    {
        var index = 0;
        for(; index < aCount; ++index)
            push(objects[index]);
    }
    return self;
}
}), new objj_method(sel_getUid("containsObject:"), function(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(self, "indexOfObject:", anObject) != CPNotFound;
}
}), new objj_method(sel_getUid("count"), function(self, _cmd)
{ with(self)
{
    return length;
}
}), new objj_method(sel_getUid("indexOfObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (anObject === nil)
        return CPNotFound;
    var i = 0,
        count = length;
    if (anObject.isa)
    {
        for(; i < count; ++i)
            if(objj_msgSend(self[i], "isEqual:", anObject))
                return i;
    }
    else if (self.indexOf)
        return indexOf(anObject);
    else
        for(; i < count; ++i)
            if(self[i] == anObject)
                return i;
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfObject:inRange:"), function(self, _cmd, anObject, aRange)
{ with(self)
{
    if (anObject === nil)
        return CPNotFound;
    var i = aRange.location,
        count = MIN(CPMaxRange(aRange), length);
    if (anObject.isa)
    {
        for(; i < count; ++i)
            if(objj_msgSend(self[i], "isEqual:", anObject))
                return i;
    }
    else
        for(; i < count; ++i)
            if(self[i] == anObject)
                return i;
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfObjectIdenticalTo:"), function(self, _cmd, anObject)
{ with(self)
{
    if (anObject === nil)
        return CPNotFound;
    if (self.indexOf)
        return indexOf(anObject);
    else
    {
        var index = 0,
            count = length;
        for(; index < count; ++index)
            if(self[index] === anObject)
                return index;
    }
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"), function(self, _cmd, anObject, aRange)
{ with(self)
{
    if (anObject === nil)
        return CPNotFound;
    if (self.indexOf)
    {
        var index = indexOf(anObject, aRange.location);
        if (CPLocationInRange(index, aRange))
            return index;
    }
    else
    {
        var index = aRange.location,
            count = MIN(CPMaxRange(aRange), length);
        for(; index < count; ++index)
            if(self[index] == anObject)
                return index;
    }
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfObject:sortedBySelector:"), function(self, _cmd, anObject, aSelector)
{ with(self)
{
    return objj_msgSend(self, "indexOfObject:sortedByFunction:", anObject,  function(lhs, rhs) { objj_msgSend(lhs, aSelector, rhs); });
}
}), new objj_method(sel_getUid("indexOfObject:sortedByFunction:"), function(self, _cmd, anObject, aFunction)
{ with(self)
{
    return objj_msgSend(self, "indexOfObject:sortedByFunction:context:", anObject, aFunction, nil);
}
}), new objj_method(sel_getUid("indexOfObject:sortedByFunction:context:"), function(self, _cmd, anObject, aFunction, aContext)
{ with(self)
{
    if (!aFunction || anObject === undefined)
        return CPNotFound;
    var mid, c, first = 0, last = length - 1;
    while (first <= last)
    {
        mid = FLOOR((first + last) / 2);
          c = aFunction(anObject, self[mid], aContext);
        if (c > 0)
            first = mid + 1;
        else if (c < 0)
            last = mid - 1;
        else
        {
            while (mid < length - 1 && aFunction(anObject, self[mid+1], aContext) == CPOrderedSame)
                mid++;
            return mid;
        }
    }
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfObject:sortedByDescriptors:"), function(self, _cmd, anObject, descriptors)
{ with(self)
{
    return objj_msgSend(self, "indexOfObject:sortedByFunction:", anObject, function(lhs, rhs)
    {
        var i = 0,
            count = objj_msgSend(descriptors, "count"),
            result = CPOrderedSame;
        while (i < count)
            if((result = objj_msgSend(descriptors[i++], "compareObject:withObject:", lhs, rhs)) != CPOrderedSame)
                return result;
        return result;
    });
}
}), new objj_method(sel_getUid("lastObject"), function(self, _cmd)
{ with(self)
{
    var count = objj_msgSend(self, "count");
    if (!count) return nil;
    return self[count - 1];
}
}), new objj_method(sel_getUid("objectAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    if (anIndex >= length || anIndex < 0)
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "index (" + anIndex + ") beyond bounds (" + length + ")");
    return self[anIndex];
}
}), new objj_method(sel_getUid("objectsAtIndexes:"), function(self, _cmd, indexes)
{ with(self)
{
    var index = CPNotFound,
        objects = [];
    while((index = objj_msgSend(indexes, "indexGreaterThanIndex:", index)) !== CPNotFound)
        objj_msgSend(objects, "addObject:", objj_msgSend(self, "objectAtIndex:", index));
    return objects;
}
}), new objj_method(sel_getUid("objectEnumerator"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_CPArrayEnumerator, "alloc"), "initWithArray:", self);
}
}), new objj_method(sel_getUid("reverseObjectEnumerator"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_CPReverseArrayEnumerator, "alloc"), "initWithArray:", self);
}
}), new objj_method(sel_getUid("makeObjectsPerformSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    if (!aSelector)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "makeObjectsPerformSelector: 'aSelector' can't be nil");
    var index = 0,
        count = length;
    for(; index < count; ++index)
        objj_msgSend(self[index], aSelector);
}
}), new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"), function(self, _cmd, aSelector, anObject)
{ with(self)
{
    if (!aSelector)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "makeObjectsPerformSelector:withObject 'aSelector' can't be nil");
    var index = 0,
        count = length;
    for(; index < count; ++index)
        objj_msgSend(self[index], aSelector, anObject);
}
}), new objj_method(sel_getUid("makeObjectsPerformSelector:withObjects:"), function(self, _cmd, aSelector, objects)
{ with(self)
{
    if (!aSelector)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "makeObjectsPerformSelector:withObjects: 'aSelector' can't be nil");
    var index = 0,
        count = length,
        argumentsArray = [nil, aSelector].concat(objects || []);
    for(; index < count; ++index)
    {
        argumentsArray[0] = self[index];
        objj_msgSend.apply(this, argumentsArray);
    }
}
}), new objj_method(sel_getUid("firstObjectCommonWithArray:"), function(self, _cmd, anArray)
{ with(self)
{
    if (!objj_msgSend(anArray, "count") || !objj_msgSend(self, "count"))
        return nil;
    var i = 0,
        count = objj_msgSend(self, "count");
    for(; i < count; ++i)
        if(objj_msgSend(anArray, "containsObject:", self[i]))
            return self[i];
    return nil;
}
}), new objj_method(sel_getUid("isEqualToArray:"), function(self, _cmd, anArray)
{ with(self)
{
    if (self === anArray)
        return YES;
    if(length != anArray.length)
        return NO;
    var index = 0,
        count = objj_msgSend(self, "count");
    for(; index < count; ++index)
    {
        var lhs = self[index],
            rhs = anArray[index];
        if (lhs !== rhs && (lhs && !lhs.isa || rhs && !rhs.isa || !objj_msgSend(lhs, "isEqual:", rhs)))
            return NO;
    }
    return YES;
}
}), new objj_method(sel_getUid("isEqual:"), function(self, _cmd, anObject)
{ with(self)
{
    if (self === anObject)
        return YES;
    if(!objj_msgSend(anObject, "isKindOfClass:", objj_msgSend(CPArray, "class")))
        return NO;
    return objj_msgSend(self, "isEqualToArray:", anObject);
}
}), new objj_method(sel_getUid("arrayByAddingObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (anObject === nil || anObject === undefined)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "arrayByAddingObject: object can't be nil");
    var array = objj_msgSend(self, "copy");
    array.push(anObject);
    return array;
}
}), new objj_method(sel_getUid("arrayByAddingObjectsFromArray:"), function(self, _cmd, anArray)
{ with(self)
{
    return slice(0).concat(anArray);
}
}), new objj_method(sel_getUid("subarrayWithRange:"), function(self, _cmd, aRange)
{ with(self)
{
    if (aRange.location < 0 || CPMaxRange(aRange) > length)
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "subarrayWithRange: aRange out of bounds");
    return slice(aRange.location, CPMaxRange(aRange));
}
}), new objj_method(sel_getUid("sortedArrayUsingDescriptors:"), function(self, _cmd, descriptors)
{ with(self)
{
    var sorted = objj_msgSend(self, "copy");
    objj_msgSend(sorted, "sortUsingDescriptors:", descriptors);
    return sorted;
}
}), new objj_method(sel_getUid("sortedArrayUsingFunction:"), function(self, _cmd, aFunction)
{ with(self)
{
    return objj_msgSend(self, "sortedArrayUsingFunction:context:", aFunction, nil);
}
}), new objj_method(sel_getUid("sortedArrayUsingFunction:context:"), function(self, _cmd, aFunction, aContext)
{ with(self)
{
    var sorted = objj_msgSend(self, "copy");
    objj_msgSend(sorted, "sortUsingFunction:context:", aFunction, aContext);
    return sorted;
}
}), new objj_method(sel_getUid("sortedArrayUsingSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    var sorted = objj_msgSend(self, "copy")
    objj_msgSend(sorted, "sortUsingSelector:", aSelector);
    return sorted;
}
}), new objj_method(sel_getUid("componentsJoinedByString:"), function(self, _cmd, aString)
{ with(self)
{
    return join(aString);
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    var index = 0,
        count = objj_msgSend(self, "count"),
        description = '(';
    for(; index < count; ++index)
    {
        if (index === 0)
            description += '\n';
        var object = objj_msgSend(self, "objectAtIndex:", index),
            objectDescription = object && object.isa ? objj_msgSend(object, "description") : String(object);
        description += "\t" + objectDescription.split('\n').join("\n\t");
        if (index !== count - 1)
            description += ", ";
        description += '\n';
    }
    return description + ')';
}
}), new objj_method(sel_getUid("pathsMatchingExtensions:"), function(self, _cmd, filterTypes)
{ with(self)
{
    var index = 0,
        count = objj_msgSend(self, "count"),
        array = [];
    for(; index < count; ++index)
        if (self[index].isa && objj_msgSend(self[index], "isKindOfClass:", objj_msgSend(CPString, "class")) && objj_msgSend(filterTypes, "containsObject:", objj_msgSend(self[index], "pathExtension")))
            array.push(self[index]);
    return array;
}
}), new objj_method(sel_getUid("setValue:forKey:"), function(self, _cmd, aValue, aKey)
{ with(self)
{
    var i = 0,
        count = objj_msgSend(self, "count");
    for(; i < count; ++i)
        objj_msgSend(self[i], "setValue:forKey:", aValue, aKey);
}
}), new objj_method(sel_getUid("valueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    var i = 0,
        count = objj_msgSend(self, "count"),
        array = [];
    for(; i < count; ++i)
        array.push(objj_msgSend(self[i], "valueForKey:", aKey));
    return array;
}
}), new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    return slice(0);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return [];
}
}), new objj_method(sel_getUid("array"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
}), new objj_method(sel_getUid("arrayWithArray:"), function(self, _cmd, anArray)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithArray:", anArray);
}
}), new objj_method(sel_getUid("arrayWithObject:"), function(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithObjects:", anObject);
}
}), new objj_method(sel_getUid("arrayWithObjects:"), function(self, _cmd, anObject)
{ with(self)
{
    var i = 2,
        array = objj_msgSend(objj_msgSend(self, "alloc"), "init"),
        argument;
    for(; i < arguments.length && (argument = arguments[i]) != nil; ++i)
        array.push(argument);
    return array;
}
}), new objj_method(sel_getUid("arrayWithObjects:count:"), function(self, _cmd, objects, aCount)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithObjects:count:", objects, aCount);
}
})]);
}
{
var the_class = objj_getClass("CPArray")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCapacity:"), function(self, _cmd, aCapacity)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("addObject:"), function(self, _cmd, anObject)
{ with(self)
{
    push(anObject);
}
}), new objj_method(sel_getUid("addObjectsFromArray:"), function(self, _cmd, anArray)
{ with(self)
{
    splice.apply(self, [length, 0].concat(anArray));
}
}), new objj_method(sel_getUid("insertObject:atIndex:"), function(self, _cmd, anObject, anIndex)
{ with(self)
{
    splice(anIndex, 0, anObject);
}
}), new objj_method(sel_getUid("insertObjects:atIndexes:"), function(self, _cmd, objects, indexes)
{ with(self)
{
    var indexesCount = objj_msgSend(indexes, "count"),
        objectsCount = objj_msgSend(objects, "count");
    if(indexesCount !== objectsCount)
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "the counts of the passed-in array (" + objectsCount + ") and index set (" + indexesCount + ") must be identical.");
    var lastIndex = objj_msgSend(indexes, "lastIndex");
    if(lastIndex >= objj_msgSend(self, "count") + indexesCount)
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "the last index (" + lastIndex + ") must be less than the sum of the original count (" + objj_msgSend(self, "count") + ") and the insertion count (" + indexesCount + ").");
    var index = 0,
        currentIndex = objj_msgSend(indexes, "firstIndex");
    for (; index < objectsCount; ++index, currentIndex = objj_msgSend(indexes, "indexGreaterThanIndex:", currentIndex))
        objj_msgSend(self, "insertObject:atIndex:", objects[index], currentIndex);
}
}), new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"), function(self, _cmd, anIndex, anObject)
{ with(self)
{
    self[anIndex] = anObject;
}
}), new objj_method(sel_getUid("replaceObjectsAtIndexes:withObjects:"), function(self, _cmd, anIndexSet, objects)
{ with(self)
{
    var i = 0,
        index = objj_msgSend(anIndexSet, "firstIndex");
    while(index != CPNotFound)
    {
        objj_msgSend(self, "replaceObjectAtIndex:withObject:", index, objects[i++]);
        index = objj_msgSend(anIndexSet, "indexGreaterThanIndex:", index);
    }
}
}), new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:range:"), function(self, _cmd, aRange, anArray, otherRange)
{ with(self)
{
    if (!otherRange.location && otherRange.length == objj_msgSend(anArray, "count"))
        objj_msgSend(self, "replaceObjectsInRange:withObjectsFromArray:", aRange, anArray);
    else
        splice.apply(self, [aRange.location, aRange.length].concat(objj_msgSend(anArray, "subarrayWithRange:", otherRange)));
}
}), new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:"), function(self, _cmd, aRange, anArray)
{ with(self)
{
    splice.apply(self, [aRange.location, aRange.length].concat(anArray));
}
}), new objj_method(sel_getUid("setArray:"), function(self, _cmd, anArray)
{ with(self)
{
    if(self == anArray) return;
    splice.apply(self, [0, length].concat(anArray));
}
}), new objj_method(sel_getUid("removeAllObjects"), function(self, _cmd)
{ with(self)
{
    splice(0, length);
}
}), new objj_method(sel_getUid("removeLastObject"), function(self, _cmd)
{ with(self)
{
    pop();
}
}), new objj_method(sel_getUid("removeObject:"), function(self, _cmd, anObject)
{ with(self)
{
    objj_msgSend(self, "removeObject:inRange:", anObject, CPMakeRange(0, length));
}
}), new objj_method(sel_getUid("removeObject:inRange:"), function(self, _cmd, anObject, aRange)
{ with(self)
{
    var index;
    while ((index = objj_msgSend(self, "indexOfObject:inRange:", anObject, aRange)) != CPNotFound)
    {
        objj_msgSend(self, "removeObjectAtIndex:", index);
        aRange = CPIntersectionRange(CPMakeRange(index, length - index), aRange);
    }
}
}), new objj_method(sel_getUid("removeObjectAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    splice(anIndex, 1);
}
}), new objj_method(sel_getUid("removeObjectsAtIndexes:"), function(self, _cmd, anIndexSet)
{ with(self)
{
    var index = objj_msgSend(anIndexSet, "lastIndex");
    while (index != CPNotFound)
    {
        objj_msgSend(self, "removeObjectAtIndex:", index);
        index = objj_msgSend(anIndexSet, "indexLessThanIndex:", index);
    }
}
}), new objj_method(sel_getUid("removeObjectIdenticalTo:"), function(self, _cmd, anObject)
{ with(self)
{
    objj_msgSend(self, "removeObjectIdenticalTo:inRange:", anObject, CPMakeRange(0, objj_msgSend(self, "count")));
}
}), new objj_method(sel_getUid("removeObjectIdenticalTo:inRange:"), function(self, _cmd, anObject, aRange)
{ with(self)
{
    var index,
        count = objj_msgSend(self, "count");
    while ((index = objj_msgSend(self, "indexOfObjectIdenticalTo:inRange:", anObject, aRange)) !== CPNotFound)
    {
        objj_msgSend(self, "removeObjectAtIndex:", index);
        aRange = CPIntersectionRange(CPMakeRange(index, (--count) - index), aRange);
    }
}
}), new objj_method(sel_getUid("removeObjectsInArray:"), function(self, _cmd, anArray)
{ with(self)
{
    var index = 0,
        count = objj_msgSend(anArray, "count");
    for (; index < count; ++index)
        objj_msgSend(self, "removeObject:", anArray[index]);
}
}), new objj_method(sel_getUid("removeObjectsInRange:"), function(self, _cmd, aRange)
{ with(self)
{
    splice(aRange.location, aRange.length);
}
}), new objj_method(sel_getUid("exchangeObjectAtIndex:withObjectAtIndex:"), function(self, _cmd, anIndex, otherIndex)
{ with(self)
{
    var temporary = self[anIndex];
    self[anIndex] = self[otherIndex];
    self[otherIndex] = temporary;
}
}), new objj_method(sel_getUid("sortUsingDescriptors:"), function(self, _cmd, descriptors)
{ with(self)
{
    sort(function(lhs, rhs)
    {
        var i = 0,
            count = objj_msgSend(descriptors, "count"),
            result = CPOrderedSame;
        while(i < count)
            if((result = objj_msgSend(descriptors[i++], "compareObject:withObject:", lhs, rhs)) != CPOrderedSame)
                return result;
        return result;
    });
}
}), new objj_method(sel_getUid("sortUsingFunction:context:"), function(self, _cmd, aFunction, aContext)
{ with(self)
{
    sort(function(lhs, rhs) { return aFunction(lhs, rhs, aContext); });
}
}), new objj_method(sel_getUid("sortUsingSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    sort(function(lhs, rhs) { return objj_msgSend(lhs, aSelector, rhs); });
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("arrayWithCapacity:"), function(self, _cmd, aCapacity)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithCapacity:", aCapacity);
}
})]);
}
{
var the_class = objj_getClass("CPArray")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("countByEnumeratingWithState:objects:count:"), function(self, _cmd, aState, objects, aCount)
{ with(self)
{
    var count = objj_msgSend(self, "count"),
        index = aState.state;
    if (index >= count)
        return 0;
    var indexIndex = 0,
        last = MIN(index + aCount, count);
    aCount = last - index;
    for (; index < last; ++index, ++indexIndex)
        objects[indexIndex] = objj_msgSend(self, "objectAtIndex:", index);
    aState.state = last;
    return aCount;
}
})]);
}
{
var the_class = objj_getClass("CPArray")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(aCoder, "decodeObjectForKey:", "CP.objects");
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "_encodeArrayOfObjects:forKey:", self, "CP.objects");
}
})]);
}
{var the_class = objj_allocateClassPair(CPArray, "CPMutableArray"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}
Array.prototype.isa = CPArray;
objj_msgSend(CPArray, "initialize");

p;20;CPAttributedString.jt;19233;@STATIC;1.0;i;10;CPObject.ji;10;CPString.ji;14;CPDictionary.ji;9;CPRange.jt;19151;objj_executeFile("CPObject.j", true);
objj_executeFile("CPString.j", true);
objj_executeFile("CPDictionary.j", true);
objj_executeFile("CPRange.j", true);
{var the_class = objj_allocateClassPair(CPObject, "CPAttributedString"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_string"), new objj_ivar("_rangeEntries")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithString:"), function(self, _cmd, aString)
{ with(self)
{
    return objj_msgSend(self, "initWithString:attributes:", aString, nil);
}
}), new objj_method(sel_getUid("initWithAttributedString:"), function(self, _cmd, aString)
{ with(self)
{
    var string = objj_msgSend(self, "initWithString:attributes:", "", nil);
    objj_msgSend(string, "setAttributedString:", aString);
    return string;
}
}), new objj_method(sel_getUid("initWithString:attributes:"), function(self, _cmd, aString, attributes)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAttributedString").super_class }, "init");
    if (!attributes)
        attributes = objj_msgSend(CPDictionary, "dictionary");
    _string = ""+aString;
    _rangeEntries = [makeRangeEntry(CPMakeRange(0, _string.length), attributes)];
    return self;
}
}), new objj_method(sel_getUid("string"), function(self, _cmd)
{ with(self)
{
    return _string;
}
}), new objj_method(sel_getUid("mutableString"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "string");
}
}), new objj_method(sel_getUid("length"), function(self, _cmd)
{ with(self)
{
    return _string.length;
}
}), new objj_method(sel_getUid("_indexOfEntryWithIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    if (anIndex < 0 || anIndex > _string.length || anIndex === undefined)
        return CPNotFound;
    var sortFunction = function(index, entry)
    {
        if (CPLocationInRange(index, entry.range))
            return CPOrderedSame;
        else if (CPMaxRange(entry.range) <= index)
            return CPOrderedDescending;
        else
            return CPOrderedAscending;
    }
    return objj_msgSend(_rangeEntries, "indexOfObject:sortedByFunction:", anIndex, sortFunction);
}
}), new objj_method(sel_getUid("attributesAtIndex:effectiveRange:"), function(self, _cmd, anIndex, aRange)
{ with(self)
{
    var entryIndex = objj_msgSend(self, "_indexOfEntryWithIndex:", anIndex);
    if (entryIndex == CPNotFound)
        return nil;
    var matchingRange = _rangeEntries[entryIndex];
    if (aRange)
    {
        aRange.location = matchingRange.range.location;
        aRange.length = matchingRange.range.length;
    }
    return matchingRange.attributes;
}
}), new objj_method(sel_getUid("attributesAtIndex:longestEffectiveRange:inRange:"), function(self, _cmd, anIndex, aRange, rangeLimit)
{ with(self)
{
    var startingEntryIndex = objj_msgSend(self, "_indexOfEntryWithIndex:", anIndex);
    if (startingEntryIndex == CPNotFound)
        return nil;
    if (!aRange)
        return _rangeEntries[startingEntryIndex].attributes;
    if (CPRangeInRange(_rangeEntries[startingEntryIndex].range, rangeLimit))
    {
        aRange.location = rangeLimit.location;
        aRange.length = rangeLimit.length;
        return _rangeEntries[startingEntryIndex].attributes;
    }
    var nextRangeIndex = startingEntryIndex - 1,
        currentEntry = _rangeEntries[startingEntryIndex],
        comparisonDict = currentEntry.attributes;
    while (nextRangeIndex >= 0)
    {
        var nextEntry = _rangeEntries[nextRangeIndex];
        if (CPMaxRange(nextEntry.range) > rangeLimit.location && objj_msgSend(nextEntry.attributes, "isEqualToDictionary:", comparisonDict))
        {
            currentEntry = nextEntry;
            nextRangeIndex--;
        }
        else
            break;
    }
    aRange.location = MAX(currentEntry.range.location, rangeLimit.location);
    currentEntry = _rangeEntries[startingEntryIndex];
    nextRangeIndex = startingEntryIndex + 1;
    while (nextRangeIndex < _rangeEntries.length)
    {
        var nextEntry = _rangeEntries[nextRangeIndex];
        if (nextEntry.range.location < CPMaxRange(rangeLimit) && objj_msgSend(nextEntry.attributes, "isEqualToDictionary:", comparisonDict))
        {
            currentEntry = nextEntry;
            nextRangeIndex++;
        }
        else
            break;
    }
    aRange.length = MIN(CPMaxRange(currentEntry.range), CPMaxRange(rangeLimit)) - aRange.location;
    return comparisonDict;
}
}), new objj_method(sel_getUid("attribute:atIndex:effectiveRange:"), function(self, _cmd, attribute, index, aRange)
{ with(self)
{
    if (!attribute)
    {
        if (aRange)
        {
            aRange.location = 0;
            aRange.length = _string.length;
        }
        return nil;
    }
    return objj_msgSend(objj_msgSend(self, "attributesAtIndex:effectiveRange:", index, aRange), "valueForKey:", attribute);
}
}), new objj_method(sel_getUid("attribute:atIndex:longestEffectiveRange:inRange:"), function(self, _cmd, attribute, anIndex, aRange, rangeLimit)
{ with(self)
{
    var startingEntryIndex = objj_msgSend(self, "_indexOfEntryWithIndex:", anIndex);
    if (startingEntryIndex == CPNotFound || !attribute)
        return nil;
    if (!aRange)
        return objj_msgSend(_rangeEntries[startingEntryIndex].attributes, "objectForKey:", attribute);
    if (CPRangeInRange(_rangeEntries[startingEntryIndex].range, rangeLimit))
    {
        aRange.location = rangeLimit.location;
        aRange.length = rangeLimit.length;
        return objj_msgSend(_rangeEntries[startingEntryIndex].attributes, "objectForKey:", attribute);
    }
    var nextRangeIndex = startingEntryIndex - 1,
        currentEntry = _rangeEntries[startingEntryIndex],
        comparisonAttribute = objj_msgSend(currentEntry.attributes, "objectForKey:", attribute);
    while (nextRangeIndex >= 0)
    {
        var nextEntry = _rangeEntries[nextRangeIndex];
        if (CPMaxRange(nextEntry.range) > rangeLimit.location && isEqual(comparisonAttribute, objj_msgSend(nextEntry.attributes, "objectForKey:", attribute)))
        {
            currentEntry = nextEntry;
            nextRangeIndex--;
        }
        else
            break;
    }
    aRange.location = MAX(currentEntry.range.location, rangeLimit.location);
    currentEntry = _rangeEntries[startingEntryIndex];
    nextRangeIndex = startingEntryIndex + 1;
    while (nextRangeIndex < _rangeEntries.length)
    {
        var nextEntry = _rangeEntries[nextRangeIndex];
        if (nextEntry.range.location < CPMaxRange(rangeLimit) && isEqual(comparisonAttribute, objj_msgSend(nextEntry.attributes, "objectForKey:", attribute)))
        {
            currentEntry = nextEntry;
            nextRangeIndex++;
        }
        else
            break;
    }
    aRange.length = MIN(CPMaxRange(currentEntry.range), CPMaxRange(rangeLimit)) - aRange.location;
    return comparisonAttribute;
}
}), new objj_method(sel_getUid("isEqualToAttributedString:"), function(self, _cmd, aString)
{ with(self)
{
 if(!aString)
  return NO;
 if(_string != objj_msgSend(aString, "string"))
  return NO;
    var myRange = CPMakeRange(),
        comparisonRange = CPMakeRange(),
        myAttributes = objj_msgSend(self, "attributesAtIndex:effectiveRange:", 0, myRange),
        comparisonAttributes = objj_msgSend(aString, "attributesAtIndex:effectiveRange:", 0, comparisonRange),
        length = _string.length;
    while (CPMaxRange(CPUnionRange(myRange, comparisonRange)) < length)
    {
        if (CPIntersectionRange(myRange, comparisonRange).length > 0 && !objj_msgSend(myAttributes, "isEqualToDictionary:", comparisonAttributes))
            return NO;
        if (CPMaxRange(myRange) < CPMaxRange(comparisonRange))
            myAttributes = objj_msgSend(self, "attributesAtIndex:effectiveRange:", CPMaxRange(myRange), myRange);
        else
            comparisonAttributes = objj_msgSend(aString, "attributesAtIndex:effectiveRange:", CPMaxRange(comparisonRange), comparisonRange);
    }
    return YES;
}
}), new objj_method(sel_getUid("isEqual:"), function(self, _cmd, anObject)
{ with(self)
{
 if (anObject == self)
  return YES;
 if (objj_msgSend(anObject, "isKindOfClass:", objj_msgSend(self, "class")))
  return objj_msgSend(self, "isEqualToAttributedString:", anObject);
 return NO;
}
}), new objj_method(sel_getUid("attributedSubstringFromRange:"), function(self, _cmd, aRange)
{ with(self)
{
    if (!aRange || CPMaxRange(aRange) > _string.length || aRange.location < 0)
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "tried to get attributedSubstring for an invalid range: "+(aRange?CPStringFromRange(aRange):"nil"));
    var newString = objj_msgSend(objj_msgSend(CPAttributedString, "alloc"), "initWithString:", _string.substring(aRange.location, CPMaxRange(aRange))),
        entryIndex = objj_msgSend(self, "_indexOfEntryWithIndex:", aRange.location),
        currentRangeEntry = _rangeEntries[entryIndex],
        lastIndex = CPMaxRange(aRange);
    newString._rangeEntries = [];
    while (currentRangeEntry && CPMaxRange(currentRangeEntry.range) < lastIndex)
    {
        var newEntry = copyRangeEntry(currentRangeEntry);
        newEntry.range.location -= aRange.location;
        if (newEntry.range.location < 0)
        {
            newEntry.range.length += newEntry.range.location;
            newEntry.range.location = 0;
        }
        newString._rangeEntries.push(newEntry);
        currentRangeEntry = _rangeEntries[++entryIndex];
    }
    if (currentRangeEntry)
    {
        var newRangeEntry = copyRangeEntry(currentRangeEntry);
        newRangeEntry.range.length = CPMaxRange(aRange) - newRangeEntry.range.location;
        newRangeEntry.range.location -= aRange.location;
        if (newRangeEntry.range.location < 0)
        {
            newRangeEntry.range.length += newRangeEntry.range.location;
            newRangeEntry.range.location = 0;
        }
        newString._rangeEntries.push(newRangeEntry);
    }
    return newString;
}
}), new objj_method(sel_getUid("replaceCharactersInRange:withString:"), function(self, _cmd, aRange, aString)
{ with(self)
{
    objj_msgSend(self, "beginEditing");
    if (!aString)
        aString = "";
    var startingIndex = objj_msgSend(self, "_indexOfEntryWithIndex:", aRange.location),
        startingRangeEntry = _rangeEntries[startingIndex],
        endingIndex = objj_msgSend(self, "_indexOfEntryWithIndex:", MAX(CPMaxRange(aRange)-1, 0)),
        endingRangeEntry = _rangeEntries[endingIndex],
        additionalLength = aString.length - aRange.length;
    _string = _string.substring(0, aRange.location) + aString + _string.substring(CPMaxRange(aRange));
    if (startingIndex == endingIndex)
        startingRangeEntry.range.length += additionalLength;
    else
    {
        endingRangeEntry.range.length = CPMaxRange(endingRangeEntry.range) - CPMaxRange(aRange);
        endingRangeEntry.range.location = CPMaxRange(aRange);
        startingRangeEntry.range.length = CPMaxRange(aRange) - startingRangeEntry.range.location;
        _rangeEntries.splice(startingIndex, endingIndex - startingIndex);
    }
    endingIndex = startingIndex + 1;
    while(endingIndex < _rangeEntries.length)
        _rangeEntries[endingIndex++].range.location+=additionalLength;
    objj_msgSend(self, "endEditing");
}
}), new objj_method(sel_getUid("deleteCharactersInRange:"), function(self, _cmd, aRange)
{ with(self)
{
    objj_msgSend(self, "replaceCharactersInRange:withString:", aRange, nil);
}
}), new objj_method(sel_getUid("setAttributes:range:"), function(self, _cmd, aDictionary, aRange)
{ with(self)
{
    objj_msgSend(self, "beginEditing");
    var startingEntryIndex = objj_msgSend(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", aRange.location, YES),
        endingEntryIndex = objj_msgSend(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", CPMaxRange(aRange), YES),
        current = startingEntryIndex;
    if (endingEntryIndex == CPNotFound)
        endingEntryIndex = _rangeEntries.length;
    while (current < endingEntryIndex)
        _rangeEntries[current++].attributes = objj_msgSend(aDictionary, "copy");
    objj_msgSend(self, "_coalesceRangeEntriesFromIndex:toIndex:", startingEntryIndex, endingEntryIndex);
    objj_msgSend(self, "endEditing");
}
}), new objj_method(sel_getUid("addAttributes:range:"), function(self, _cmd, aDictionary, aRange)
{ with(self)
{
    objj_msgSend(self, "beginEditing");
    var startingEntryIndex = objj_msgSend(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", aRange.location, YES),
        endingEntryIndex = objj_msgSend(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", CPMaxRange(aRange), YES),
        current = startingEntryIndex;
    if (endingEntryIndex == CPNotFound)
        endingEntryIndex = _rangeEntries.length;
    while (current < endingEntryIndex)
    {
        var keys = objj_msgSend(aDictionary, "allKeys"),
            count = objj_msgSend(keys, "count");
        while (count--)
            objj_msgSend(_rangeEntries[current].attributes, "setObject:forKey:", objj_msgSend(aDictionary, "objectForKey:", keys[count]), keys[count]);
        current++;
    }
    objj_msgSend(self, "_coalesceRangeEntriesFromIndex:toIndex:", startingEntryIndex, endingEntryIndex);
    objj_msgSend(self, "endEditing");
}
}), new objj_method(sel_getUid("addAttribute:value:range:"), function(self, _cmd, anAttribute, aValue, aRange)
{ with(self)
{
    objj_msgSend(self, "addAttributes:range:", objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", aValue, anAttribute), aRange);
}
}), new objj_method(sel_getUid("removeAttribute:range:"), function(self, _cmd, anAttribute, aRange)
{ with(self)
{
    objj_msgSend(self, "beginEditing");
    var startingEntryIndex = objj_msgSend(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", aRange.location, YES),
        endingEntryIndex = objj_msgSend(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", CPMaxRange(aRange), YES),
        current = startingEntryIndex;
    if (endingEntryIndex == CPNotFound)
        endingEntryIndex = _rangeEntries.length;
    while (current < endingEntryIndex)
        objj_msgSend(_rangeEntries[current++].attributes, "removeObjectForKey:", anAttribute);
    objj_msgSend(self, "_coalesceRangeEntriesFromIndex:toIndex:", startingEntryIndex, endingEntryIndex);
    objj_msgSend(self, "endEditing");
}
}), new objj_method(sel_getUid("appendAttributedString:"), function(self, _cmd, aString)
{ with(self)
{
    objj_msgSend(self, "insertAttributedString:atIndex:", aString, _string.length);
}
}), new objj_method(sel_getUid("insertAttributedString:atIndex:"), function(self, _cmd, aString, anIndex)
{ with(self)
{
    objj_msgSend(self, "beginEditing");
    if (anIndex < 0 || anIndex > objj_msgSend(self, "length"))
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "tried to insert attributed string at an invalid index: "+anIndex);
    var entryIndexOfNextEntry = objj_msgSend(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", anIndex, YES),
        otherRangeEntries = aString._rangeEntries,
        length = objj_msgSend(aString, "length");
    if (entryIndexOfNextEntry == CPNotFound)
        entryIndexOfNextEntry = _rangeEntries.length;
    _string = _string.substring(0, anIndex) + aString._string + _string.substring(anIndex);
    var current = entryIndexOfNextEntry;
    while (current < _rangeEntries.length)
        _rangeEntries[current++].range.location += length;
    var newRangeEntryCount = otherRangeEntries.length,
        index = 0;
    while (index < newRangeEntryCount)
    {
        var entryCopy = copyRangeEntry(otherRangeEntries[index++]);
        entryCopy.range.location += anIndex;
        _rangeEntries.splice(entryIndexOfNextEntry-1+index, 0, entryCopy);
    }
    objj_msgSend(self, "endEditing");
}
}), new objj_method(sel_getUid("replaceCharactersInRange:withAttributedString:"), function(self, _cmd, aRange, aString)
{ with(self)
{
    objj_msgSend(self, "beginEditing");
    objj_msgSend(self, "deleteCharactersInRange:", aRange);
    objj_msgSend(self, "insertAttributedString:atIndex:", aString, aRange.location);
    objj_msgSend(self, "endEditing");
}
}), new objj_method(sel_getUid("setAttributedString:"), function(self, _cmd, aString)
{ with(self)
{
    objj_msgSend(self, "beginEditing");
    _string = aString._string;
    _rangeEntries = [];
    for (var i=0, count = aString._rangeEntries.length; i<count; i++)
        _rangeEntries.push(copyRangeEntry(aString._rangeEntries[i]));
    objj_msgSend(self, "endEditing");
}
}), new objj_method(sel_getUid("_indexOfRangeEntryForIndex:splitOnMaxIndex:"), function(self, _cmd, characterIndex, split)
{ with(self)
{
    var index = objj_msgSend(self, "_indexOfEntryWithIndex:", characterIndex);
    if (index < 0)
        return index;
    var rangeEntry = _rangeEntries[index];
    if (rangeEntry.range.location == characterIndex || (CPMaxRange(rangeEntry.range) - 1 == characterIndex && !split))
        return index;
    var newEntries = splitRangeEntryAtIndex(rangeEntry, characterIndex);
    _rangeEntries.splice(index, 1, newEntries[0], newEntries[1]);
    index++;
    return index;
}
}), new objj_method(sel_getUid("_coalesceRangeEntriesFromIndex:toIndex:"), function(self, _cmd, start, end)
{ with(self)
{
    var current = start;
    if (end >= _rangeEntries.length)
        end = _rangeEntries.length -1;
    while (current < end)
    {
        var a = _rangeEntries[current],
            b = _rangeEntries[current+1];
        if (objj_msgSend(a.attributes, "isEqualToDictionary:", b.attributes))
        {
            a.range.length = CPMaxRange(b.range) - a.range.location;
            _rangeEntries.splice(current+1, 1);
            end--;
        }
        else
            current++;
    }
}
}), new objj_method(sel_getUid("beginEditing"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("endEditing"), function(self, _cmd)
{ with(self)
{
}
})]);
}
{var the_class = objj_allocateClassPair(CPAttributedString, "CPMutableAttributedString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}
var isEqual = isEqual= function(a, b)
{
    if (a == b)
        return YES;
    if (objj_msgSend(a, "respondsToSelector:", sel_getUid("isEqual:")) && objj_msgSend(a, "isEqual:", b))
        return YES;
    return NO;
}
var makeRangeEntry = makeRangeEntry= function( aRange, attributes)
{
    return {range:aRange, attributes:objj_msgSend(attributes, "copy")};
}
var copyRangeEntry = copyRangeEntry= function( aRangeEntry)
{
    return makeRangeEntry(CPCopyRange(aRangeEntry.range), objj_msgSend(aRangeEntry.attributes, "copy"));
}
var splitRangeEntry = splitRangeEntryAtIndex= function( aRangeEntry, anIndex)
{
    var newRangeEntry = copyRangeEntry(aRangeEntry),
        cachedIndex = CPMaxRange(aRangeEntry.range);
    aRangeEntry.range.length = anIndex - aRangeEntry.range.location;
    newRangeEntry.range.location = anIndex;
    newRangeEntry.range.length = cachedIndex - anIndex;
    newRangeEntry.attributes = objj_msgSend(newRangeEntry.attributes, "copy");
    return [aRangeEntry, newRangeEntry];
}

p;10;CPBundle.jt;3922;@STATIC;1.0;i;10;CPObject.ji;14;CPDictionary.ji;14;CPURLRequest.jt;3850;objj_executeFile("CPObject.j", true);
objj_executeFile("CPDictionary.j", true);
objj_executeFile("CPURLRequest.j", true);
var CPBundlesForPaths = { };
{var the_class = objj_allocateClassPair(CPObject, "CPBundle"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bundle"), new objj_ivar("_delegate")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithPath:"), function(self, _cmd, aPath)
{ with(self)
{
    var existingBundle = CPBundlesForPaths[aPath];
    if (existingBundle)
        return existingBundle;
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBundle").super_class }, "init");
    if (self)
    {
        _bundle = new CFBundle(aPath);
        CPBundlesForPaths[aPath] = self;
    }
    return self;
}
}), new objj_method(sel_getUid("classNamed:"), function(self, _cmd, aString)
{ with(self)
{
}
}), new objj_method(sel_getUid("bundlePath"), function(self, _cmd)
{ with(self)
{
    return _bundle.path();
}
}), new objj_method(sel_getUid("resourcePath"), function(self, _cmd)
{ with(self)
{
    var resourcePath = objj_msgSend(self, "bundlePath");
    if (resourcePath.length)
        resourcePath += '/';
    return resourcePath + "Resources";
}
}), new objj_method(sel_getUid("principalClass"), function(self, _cmd)
{ with(self)
{
    var className = objj_msgSend(self, "objectForInfoDictionaryKey:", "CPPrincipalClass");
    return className ? CPClassFromString(className) : Nil;
}
}), new objj_method(sel_getUid("pathForResource:"), function(self, _cmd, aFilename)
{ with(self)
{
    return _bundle.pathForResource(aFilename);
}
}), new objj_method(sel_getUid("infoDictionary"), function(self, _cmd)
{ with(self)
{
    return _bundle.infoDictionary();
}
}), new objj_method(sel_getUid("objectForInfoDictionaryKey:"), function(self, _cmd, aKey)
{ with(self)
{
    return _bundle.valueForInfoDictionary(aKey);
}
}), new objj_method(sel_getUid("loadWithDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
    _bundle.addEventListener("load", function()
    {
        objj_msgSend(_delegate, "bundleDidFinishLoading:", self);
    });
    _bundle.addEventListener("error", function()
    {
        CPLog.error("Could not find bundle: " + self);
    });
    _bundle.load(NO);
}
}), new objj_method(sel_getUid("staticResourceURLs"), function(self, _cmd)
{ with(self)
{
    var staticResourceURLs = [],
        staticResources = _bundle.staticResources(),
        index = 0,
        count = objj_msgSend(staticResources, "count");
    for (; index < count; ++index)
        objj_msgSend(staticResourceURLs, "addObject:", objj_msgSend(CPURL, "URLWithString:", staticResources[index].path()));
    return staticResourceURLs;
}
}), new objj_method(sel_getUid("environments"), function(self, _cmd)
{ with(self)
{
    return _bundle.environments();
}
}), new objj_method(sel_getUid("mostEligibleEnvironment"), function(self, _cmd)
{ with(self)
{
    return _bundle.mostEligibleEnvironment();
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBundle").super_class }, "description") + "(" + objj_msgSend(self, "bundlePath") + ")";
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("bundleWithPath:"), function(self, _cmd, aPath)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithPath:", aPath);
}
}), new objj_method(sel_getUid("bundleForClass:"), function(self, _cmd, aClass)
{ with(self)
{
    return objj_msgSend(self, "bundleWithPath:", CFBundle.bundleForClass(aClass).path());
}
}), new objj_method(sel_getUid("mainBundle"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPBundle, "bundleWithPath:", CFBundle.mainBundle().path());
}
})]);
}

p;9;CPCoder.jt;2257;@STATIC;1.0;i;10;CPObject.ji;13;CPException.jt;2205;objj_executeFile("CPObject.j", true);
objj_executeFile("CPException.j", true);
{var the_class = objj_allocateClassPair(CPObject, "CPCoder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("allowsKeyedCoding"), function(self, _cmd)
{ with(self)
{
   return NO;
}
}), new objj_method(sel_getUid("encodeValueOfObjCType:at:"), function(self, _cmd, aType, anObject)
{ with(self)
{
   CPInvalidAbstractInvocation();
}
}), new objj_method(sel_getUid("encodeDataObject:"), function(self, _cmd, aData)
{ with(self)
{
   CPInvalidAbstractInvocation();
}
}), new objj_method(sel_getUid("encodeObject:"), function(self, _cmd, anObject)
{ with(self)
{
}
}), new objj_method(sel_getUid("encodePoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    objj_msgSend(self, "encodeNumber:", aPoint.x);
    objj_msgSend(self, "encodeNumber:", aPoint.y);
}
}), new objj_method(sel_getUid("encodeRect:"), function(self, _cmd, aRect)
{ with(self)
{
    objj_msgSend(self, "encodePoint:", aRect.origin);
    objj_msgSend(self, "encodeSize:", aRect.size);
}
}), new objj_method(sel_getUid("encodeSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSend(self, "encodeNumber:", aSize.width);
    objj_msgSend(self, "encodeNumber:", aSize.height);
}
}), new objj_method(sel_getUid("encodePropertyList:"), function(self, _cmd, aPropertyList)
{ with(self)
{
}
}), new objj_method(sel_getUid("encodeRootObject:"), function(self, _cmd, anObject)
{ with(self)
{
   objj_msgSend(self, "encodeObject:", anObject);
}
}), new objj_method(sel_getUid("encodeBycopyObject:"), function(self, _cmd, anObject)
{ with(self)
{
   objj_msgSend(self, "encodeObject:", object);
}
}), new objj_method(sel_getUid("encodeConditionalObject:"), function(self, _cmd, anObject)
{ with(self)
{
   objj_msgSend(self, "encodeObject:", object);
}
})]);
}
{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("awakeAfterUsingCoder:"), function(self, _cmd, aDecoder)
{ with(self)
{
    return self;
}
})]);
}

p;14;CPCountedSet.jt;1660;@STATIC;1.0;i;7;CPSet.jt;1630;objj_executeFile("CPSet.j", true);
{var the_class = objj_allocateClassPair(CPMutableSet, "CPCountedSet"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_counts")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("addObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (!_counts)
        _counts = {};
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCountedSet").super_class }, "addObject:", anObject);
    var UID = objj_msgSend(anObject, "UID");
    if (_counts[UID] === undefined)
        _counts[UID] = 1;
    else
        ++_counts[UID];
}
}), new objj_method(sel_getUid("removeObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (!_counts)
        return;
    var UID = objj_msgSend(anObject, "UID");
    if (_counts[UID] === undefined)
        return;
    else
    {
        --_counts[UID];
        if (_counts[UID] === 0)
        {
            delete _counts[UID];
            objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCountedSet").super_class }, "removeObject:", anObject);
        }
    }
}
}), new objj_method(sel_getUid("removeAllObjects"), function(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCountedSet").super_class }, "removeAllObjects");
    _counts = {};
}
}), new objj_method(sel_getUid("countForObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (!_counts)
        _counts = {};
    var UID = objj_msgSend(anObject, "UID");
    if (_counts[UID] === undefined)
        return 0;
    return _counts[UID];
}
})]);
}

p;8;CPData.jt;3293;@STATIC;1.0;i;10;CPObject.ji;10;CPString.jt;3244;objj_executeFile("CPObject.j", true);
objj_executeFile("CPString.j", true);
{var the_class = objj_allocateClassPair(CPObject, "CPData"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithEncodedString:"), function(self, _cmd, aString)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPData").super_class }, "init");
    if (self)
        objj_msgSend(self, "setEncodedString:", aString);
    return self;
}
}), new objj_method(sel_getUid("initWithSerializedPlistObject:"), function(self, _cmd, aPlistObject)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPData").super_class }, "init");
    if (self)
        objj_msgSend(self, "setSerializedPlistObject:", aPlistObject);
    return self;
}
}), new objj_method(sel_getUid("initWithSerializedPlistObject:format:"), function(self, _cmd, aPlistObject, aFormat)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPData").super_class }, "init");
    if (self)
        objj_msgSend(self, "setSerializedPlistObject:format:", aPlistObject, aFormat);
    return self;
}
}), new objj_method(sel_getUid("length"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "encodedString"), "length");
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return self.toString();
}
}), new objj_method(sel_getUid("encodedString"), function(self, _cmd)
{ with(self)
{
    return self.encodedString();
}
}), new objj_method(sel_getUid("setEncodedString:"), function(self, _cmd, aString)
{ with(self)
{
    self.setEncodedString(aString);
}
}), new objj_method(sel_getUid("serializedPlistObject"), function(self, _cmd)
{ with(self)
{
    return self.serializedPropertyList();
}
}), new objj_method(sel_getUid("setSerializedPlistObject:"), function(self, _cmd, aPlistObject)
{ with(self)
{
    self.setSerializedPropertyList(aPlistObject);
}
}), new objj_method(sel_getUid("setSerializedPlistObject:format:"), function(self, _cmd, aPlistObject, aFormat)
{ with(self)
{
    self.setSerializedPropertyList(aPlistObject, aFormat);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return new CFMutableData();
}
}), new objj_method(sel_getUid("data"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
}), new objj_method(sel_getUid("dataWithEncodedString:"), function(self, _cmd, aString)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithEncodedString:", aString);
}
}), new objj_method(sel_getUid("dataWithSerializedPlistObject:"), function(self, _cmd, aPlistObject)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithSerializedPlistObject:", aPlistObject);
}
}), new objj_method(sel_getUid("dataWithSerializedPlistObject:format:"), function(self, _cmd, aPlistObject, aFormat)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithSerializedPlistObject:format:", aPlistObject, aFormat);
}
})]);
}
CFData.prototype.isa = CPData;
CFMutableData.prototype.isa = CPData;

p;8;CPDate.jt;6052;@STATIC;1.0;i;10;CPObject.ji;10;CPString.jt;6003;objj_executeFile("CPObject.j", true);
objj_executeFile("CPString.j", true);
var CPDateReferenceDate = new Date(Date.UTC(2001,1,1,0,0,0,0));
{var the_class = objj_allocateClassPair(CPObject, "CPDate"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithTimeIntervalSinceNow:"), function(self, _cmd, seconds)
{ with(self)
{
    self = new Date((new Date()).getTime() + seconds * 1000);
    return self;
}
}), new objj_method(sel_getUid("initWithTimeIntervalSince1970:"), function(self, _cmd, seconds)
{ with(self)
{
    self = new Date(seconds * 1000);
    return self;
}
}), new objj_method(sel_getUid("initWithTimeIntervalSinceReferenceDate:"), function(self, _cmd, seconds)
{ with(self)
{
    self = objj_msgSend(self, "initWithTimeInterval:sinceDate:", seconds, CPDateReferenceDate);
    return self;
}
}), new objj_method(sel_getUid("initWithTimeInterval:sinceDate:"), function(self, _cmd, seconds, refDate)
{ with(self)
{
    self = new Date(refDate.getTime() + seconds * 1000);
    return self;
}
}), new objj_method(sel_getUid("initWithString:"), function(self, _cmd, description)
{ with(self)
{
    var format = /(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2}) ([-+])(\d{2})(\d{2})/,
        d = description.match(new RegExp(format));
    if (!d || d.length != 10)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "initWithString: the string must be of YYYY-MM-DD HH:MM:SS ±HHMM format");
    var date = new Date(d[1], d[2]-1, d[3]),
        timeZoneOffset = (Number(d[8]) * 60 + Number(d[9])) * (d[7] === '-' ? -1 : 1);
    date.setHours(d[4]);
    date.setMinutes(d[5]);
    date.setSeconds(d[6]);
    self = new Date(date.getTime() + (timeZoneOffset - date.getTimezoneOffset()) * 60 * 1000);
    return self;
}
}), new objj_method(sel_getUid("timeIntervalSinceDate:"), function(self, _cmd, anotherDate)
{ with(self)
{
    return (self.getTime() - anotherDate.getTime()) / 1000.0;
}
}), new objj_method(sel_getUid("timeIntervalSinceNow"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "timeIntervalSinceDate:", objj_msgSend(CPDate, "date"));
}
}), new objj_method(sel_getUid("timeIntervalSince1970"), function(self, _cmd)
{ with(self)
{
    return self.getTime() / 1000.0;
}
}), new objj_method(sel_getUid("timeIntervalSinceReferenceDate"), function(self, _cmd)
{ with(self)
{
    return (self.getTime() - CPDateReferenceDate.getTime()) / 1000.0;
}
}), new objj_method(sel_getUid("isEqual:"), function(self, _cmd, aDate)
{ with(self)
{
    return objj_msgSend(self, "isEqualToDate:", aDate);
}
}), new objj_method(sel_getUid("isEqualToDate:"), function(self, _cmd, anotherDate)
{ with(self)
{
    return self === anotherDate || (anotherDate !== nil && anotherDate.isa && objj_msgSend(anotherDate, "isKindOfClass:", CPDate) && !(self < anotherDate || self > anotherDate));
}
}), new objj_method(sel_getUid("compare:"), function(self, _cmd, anotherDate)
{ with(self)
{
    return (self > anotherDate) ? CPOrderedDescending : ((self < anotherDate) ? CPOrderedAscending : CPOrderedSame);
}
}), new objj_method(sel_getUid("earlierDate:"), function(self, _cmd, anotherDate)
{ with(self)
{
    return (self < anotherDate) ? self : anotherDate;
}
}), new objj_method(sel_getUid("laterDate:"), function(self, _cmd, anotherDate)
{ with(self)
{
    return (self > anotherDate) ? self : anotherDate;
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    var hours = Math.floor(self.getTimezoneOffset() / 60),
        minutes = self.getTimezoneOffset() - hours * 60;
    return objj_msgSend(CPString, "stringWithFormat:", "%04d-%02d-%02d %02d:%02d:%02d +%02d%02d", self.getFullYear(), self.getMonth()+1, self.getDate(), self.getHours(), self.getMinutes(), self.getSeconds(), hours, minutes);
}
}), new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    return new Date(self.getTime());
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return new Date;
}
}), new objj_method(sel_getUid("date"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
}), new objj_method(sel_getUid("dateWithTimeIntervalSinceNow:"), function(self, _cmd, seconds)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPDate, "alloc"), "initWithTimeIntervalSinceNow:", seconds);
}
}), new objj_method(sel_getUid("dateWithTimeIntervalSince1970:"), function(self, _cmd, seconds)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPDate, "alloc"), "initWithTimeIntervalSince1970:", seconds);
}
}), new objj_method(sel_getUid("dateWithTimeIntervalSinceReferenceDate:"), function(self, _cmd, seconds)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPDate, "alloc"), "initWithTimeIntervalSinceReferenceDate:", seconds);
}
}), new objj_method(sel_getUid("distantPast"), function(self, _cmd)
{ with(self)
{
    return new Date(-10000,1,1,0,0,0,0);
}
}), new objj_method(sel_getUid("distantFuture"), function(self, _cmd)
{ with(self)
{
    return new Date(10000,1,1,0,0,0,0);
}
}), new objj_method(sel_getUid("timeIntervalSinceReferenceDate"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPDate, "date"), "timeIntervalSinceReferenceDate");
}
})]);
}
var CPDateTimeKey = "CPDateTimeKey";
{
var the_class = objj_getClass("CPDate")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDate\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    if (self)
    {
        self.setTime(objj_msgSend(aCoder, "decodeIntForKey:", CPDateTimeKey));
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeInt:forKey:", self.getTime(), CPDateTimeKey);
}
})]);
}
Date.prototype.isa = CPDate;

p;14;CPDictionary.jt;10202;@STATIC;1.0;i;9;CPArray.ji;10;CPObject.ji;14;CPEnumerator.ji;13;CPException.jt;10117;objj_executeFile("CPArray.j", true);
objj_executeFile("CPObject.j", true);
objj_executeFile("CPEnumerator.j", true);
objj_executeFile("CPException.j", true);
{var the_class = objj_allocateClassPair(CPEnumerator, "_CPDictionaryValueEnumerator"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_keyEnumerator"), new objj_ivar("_dictionary")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithDictionary:"), function(self, _cmd, aDictionary)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDictionaryValueEnumerator").super_class }, "init");
    if (self)
    {
        _keyEnumerator = objj_msgSend(aDictionary, "keyEnumerator");
        _dictionary = aDictionary;
    }
    return self;
}
}), new objj_method(sel_getUid("nextObject"), function(self, _cmd)
{ with(self)
{
    var key = objj_msgSend(_keyEnumerator, "nextObject");
    if (!key)
        return nil;
    return objj_msgSend(_dictionary, "objectForKey:", key);
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "CPDictionary"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithDictionary:"), function(self, _cmd, aDictionary)
{ with(self)
{
    var key = "",
        dictionary = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    for (key in aDictionary._buckets)
        objj_msgSend(dictionary, "setObject:forKey:", objj_msgSend(aDictionary, "objectForKey:", key), key);
    return dictionary;
}
}), new objj_method(sel_getUid("initWithObjects:forKeys:"), function(self, _cmd, objects, keyArray)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDictionary").super_class }, "init");
    if (objj_msgSend(objects, "count") != objj_msgSend(keyArray, "count"))
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Counts are different.("+objj_msgSend(objects, "count")+"!="+objj_msgSend(keyArray, "count")+")");
    if (self)
    {
        var i = objj_msgSend(keyArray, "count");
        while (i--)
            objj_msgSend(self, "setObject:forKey:", objects[i], keyArray[i]);
    }
    return self;
}
}), new objj_method(sel_getUid("initWithObjectsAndKeys:"), function(self, _cmd, firstObject)
{ with(self)
{
    var argCount = arguments.length;
    if (argCount % 2 !== 0)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Key-value count is mismatched. (" + argCount + " arguments passed)");
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDictionary").super_class }, "init");
    if (self)
    {
        var index = 2;
        for(; index < argCount; index += 2)
        {
            var value = arguments[index];
            if (value === nil)
                break;
            objj_msgSend(self, "setObject:forKey:", value, arguments[index + 1]);
        }
    }
    return self;
}
}), new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithDictionary:", self);
}
}), new objj_method(sel_getUid("count"), function(self, _cmd)
{ with(self)
{
    return _count;
}
}), new objj_method(sel_getUid("allKeys"), function(self, _cmd)
{ with(self)
{
    return _keys;
}
}), new objj_method(sel_getUid("allValues"), function(self, _cmd)
{ with(self)
{
    var index = _keys.length,
        values = [];
    while (index--)
        values.push(self.valueForKey(_keys[index]));
    return values;
}
}), new objj_method(sel_getUid("keyEnumerator"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_keys, "objectEnumerator");
}
}), new objj_method(sel_getUid("objectEnumerator"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_CPDictionaryValueEnumerator, "alloc"), "initWithDictionary:", self);
}
}), new objj_method(sel_getUid("isEqualToDictionary:"), function(self, _cmd, aDictionary)
{ with(self)
{
    var count = objj_msgSend(self, "count");
    if (count !== objj_msgSend(aDictionary, "count"))
        return NO;
    var index = count;
    while (index--)
    {
        var currentKey = _keys[index],
            lhsObject = _buckets[currentKey],
            rhsObject = aDictionary._buckets[currentKey];
        if (lhsObject === rhsObject)
            continue;
        if (lhsObject && lhsObject.isa && rhsObject && rhsObject.isa && objj_msgSend(lhsObject, "respondsToSelector:", sel_getUid("isEqual:")) && objj_msgSend(lhsObject, "isEqual:", rhsObject))
            continue;
        return NO;
    }
    return YES;
}
}), new objj_method(sel_getUid("objectForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    var object = _buckets[aKey];
    return (object === undefined) ? nil : object;
}
}), new objj_method(sel_getUid("removeAllObjects"), function(self, _cmd)
{ with(self)
{
    self.removeAllValues();
}
}), new objj_method(sel_getUid("removeObjectForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    self.removeValueForKey(aKey);
}
}), new objj_method(sel_getUid("removeObjectsForKeys:"), function(self, _cmd, keysForRemoval)
{ with(self)
{
    var index = keysForRemoval.length;
    while (index--)
        self.removeValueForKey(keysForRemoval[index]);
}
}), new objj_method(sel_getUid("setObject:forKey:"), function(self, _cmd, anObject, aKey)
{ with(self)
{
    self.setValueForKey(aKey, anObject);
}
}), new objj_method(sel_getUid("addEntriesFromDictionary:"), function(self, _cmd, aDictionary)
{ with(self)
{
    if (!aDictionary)
        return;
    var keys = objj_msgSend(aDictionary, "allKeys"),
        index = objj_msgSend(keys, "count");
    while (index--)
    {
        var key = keys[index];
        objj_msgSend(self, "setObject:forKey:", objj_msgSend(aDictionary, "objectForKey:", key), key);
    }
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return self.toString();
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return new CFMutableDictionary();
}
}), new objj_method(sel_getUid("dictionary"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
}), new objj_method(sel_getUid("dictionaryWithDictionary:"), function(self, _cmd, aDictionary)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithDictionary:", aDictionary);
}
}), new objj_method(sel_getUid("dictionaryWithObject:forKey:"), function(self, _cmd, anObject, aKey)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithObjects:forKeys:", [anObject], [aKey]);
}
}), new objj_method(sel_getUid("dictionaryWithObjects:forKeys:"), function(self, _cmd, objects, keys)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithObjects:forKeys:", objects, keys);
}
}), new objj_method(sel_getUid("dictionaryWithJSObject:"), function(self, _cmd, object)
{ with(self)
{
    return objj_msgSend(self, "dictionaryWithJSObject:recursively:", object, NO);
}
}), new objj_method(sel_getUid("dictionaryWithJSObject:recursively:"), function(self, _cmd, object, recursively)
{ with(self)
{
    var dictionary = objj_msgSend(objj_msgSend(self, "alloc"), "init");
    for (var key in object)
    {
        if (!object.hasOwnProperty(key))
            continue;
        var value = object[key];
        if (recursively)
        {
            if (value.constructor === Object)
                value = objj_msgSend(CPDictionary, "dictionaryWithJSObject:recursively:", value, YES);
            else if (objj_msgSend(value, "isKindOfClass:", CPArray))
            {
                var newValue = [];
                for (var i = 0, count = value.length; i < count; i++)
                {
                    var thisValue = value[i];
                    if (thisValue.constructor === Object)
                        newValue.push(objj_msgSend(CPDictionary, "dictionaryWithJSObject:recursively:", thisValue, YES));
                    else
                        newValue.push(thisValue);
                }
                value = newValue;
            }
        }
        objj_msgSend(dictionary, "setObject:forKey:", value, key);
    }
    return dictionary;
}
}), new objj_method(sel_getUid("dictionaryWithObjectsAndKeys:"), function(self, _cmd, firstObject)
{ with(self)
{
    arguments[0] = objj_msgSend(self, "alloc");
    arguments[1] = sel_getUid("initWithObjectsAndKeys:");
    return objj_msgSend.apply(this, arguments);
}
})]);
}
{
var the_class = objj_getClass("CPDictionary")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(aCoder, "_decodeDictionaryOfObjectsForKey:", "CP.objects");
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "_encodeDictionaryOfObjects:forKey:", self, "CP.objects");
}
})]);
}
{
var the_class = objj_getClass("CPDictionary")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("countByEnumeratingWithState:objects:count:"), function(self, _cmd, aState, objects, aCount)
{ with(self)
{
    var count = objj_msgSend(self, "count");
    if (aState.state >= count)
        return 0;
    var keys = objj_msgSend(self, "allKeys"),
        index = count,
        objects = new Array(count);
    while (index--)
        objects[index] = objj_msgSend(self, "objectForKey:", keys[index]);
    aState.items0 = objects;
    aState.items1 = keys;
    aState.state = count;
    return count;
}
})]);
}
{var the_class = objj_allocateClassPair(CPDictionary, "CPMutableDictionary"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}
CFDictionary.prototype.isa = CPDictionary;
CFMutableDictionary.prototype.isa = CPMutableDictionary;

p;14;CPEnumerator.jt;704;@STATIC;1.0;i;10;CPObject.jt;671;objj_executeFile("CPObject.j", true);
{var the_class = objj_allocateClassPair(CPObject, "CPEnumerator"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("nextObject"), function(self, _cmd)
{ with(self)
{
    return nil;
}
}), new objj_method(sel_getUid("allObjects"), function(self, _cmd)
{ with(self)
{
    return [];
}
}), new objj_method(sel_getUid("countByEnumeratingWithState:objects:count:"), function(self, _cmd, aState, objects, aCount)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "allObjects"), "countByEnumeratingWithState:objects:count:", aState, objects, aCount);
}
})]);
}

p;13;CPException.jt;4350;@STATIC;1.0;i;9;CPCoder.ji;10;CPObject.ji;10;CPString.jt;4288;objj_executeFile("CPCoder.j", true);
objj_executeFile("CPObject.j", true);
objj_executeFile("CPString.j", true);
CPInvalidArgumentException = "CPInvalidArgumentException";
CPUnsupportedMethodException = "CPUnsupportedMethodException";
CPRangeException = "CPRangeException";
CPInternalInconsistencyException = "CPInternalInconsistencyException";
{var the_class = objj_allocateClassPair(CPObject, "CPException"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_userInfo")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithName:reason:userInfo:"), function(self, _cmd, aName, aReason, aUserInfo)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPException").super_class }, "init");
    if (self)
    {
        name = aName;
        message = aReason;
        _userInfo = aUserInfo;
    }
    return self;
}
}), new objj_method(sel_getUid("name"), function(self, _cmd)
{ with(self)
{
    return name;
}
}), new objj_method(sel_getUid("reason"), function(self, _cmd)
{ with(self)
{
    return message;
}
}), new objj_method(sel_getUid("userInfo"), function(self, _cmd)
{ with(self)
{
    return _userInfo;
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return message;
}
}), new objj_method(sel_getUid("raise"), function(self, _cmd)
{ with(self)
{
    throw self;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return new Error();
}
}), new objj_method(sel_getUid("raise:reason:"), function(self, _cmd, aName, aReason)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "exceptionWithName:reason:userInfo:", aName, aReason, nil), "raise");
}
}), new objj_method(sel_getUid("exceptionWithName:reason:userInfo:"), function(self, _cmd, aName, aReason, aUserInfo)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithName:reason:userInfo:", aName, aReason, aUserInfo);
}
})]);
}
{
var the_class = objj_getClass("CPException")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPException\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "class"), "exceptionWithName:reason:userInfo:", name, message, _userInfo);
}
})]);
}
var CPExceptionNameKey = "CPExceptionNameKey",
    CPExceptionReasonKey = "CPExceptionReasonKey",
    CPExceptionUserInfoKey = "CPExceptionUserInfoKey";
{
var the_class = objj_getClass("CPException")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPException\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPException").super_class }, "init");
    if (self)
    {
        name = objj_msgSend(aCoder, "decodeObjectForKey:", CPExceptionNameKey);
        message = objj_msgSend(aCoder, "decodeObjectForKey:", CPExceptionReasonKey);
        _userInfo = objj_msgSend(aCoder, "decodeObjectForKey:", CPExceptionUserInfoKey);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", name, CPExceptionNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", message, CPExceptionReasonKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _userInfo, CPExceptionUserInfoKey);
}
})]);
}
Error.prototype.isa = CPException;
Error.prototype._userInfo = NULL;
objj_msgSend(CPException, "initialize");
_CPRaiseInvalidAbstractInvocation= function(anObject, aSelector)
{
    objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "*** -" + sel_getName(aSelector) + " cannot be sent to an abstract object of class " + objj_msgSend(anObject, "className") + ": Create a concrete instance!");
}
_CPReportLenientDeprecation= function( aClass, oldSelector, newSelector)
{
    CPLog.warn("[" + CPStringFromClass(aClass) + " " + CPStringFromSelector(oldSelector) + "] is deprecated, using " + CPStringFromSelector(newSelector) + " instead.");
}

p;21;CPFunctionOperation.jt;1583;@STATIC;1.0;I;21;Foundation/CPObject.ji;13;CPOperation.jt;1520;objj_executeFile("Foundation/CPObject.j", false);
objj_executeFile("CPOperation.j", true);
{var the_class = objj_allocateClassPair(CPOperation, "CPFunctionOperation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_functions")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("main"), function(self, _cmd)
{ with(self)
{
    if (_functions && objj_msgSend(_functions, "count") > 0)
    {
        var i = 0;
        for (i = 0; i < objj_msgSend(_functions, "count"); i++)
        {
            var func = objj_msgSend(_functions, "objectAtIndex:", i);
            func();
        }
    }
}
}), new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPFunctionOperation").super_class }, "init"))
    {
        _functions = [];
    }
    return self;
}
}), new objj_method(sel_getUid("addExecutionFunction:"), function(self, _cmd, jsFunction)
{ with(self)
{
    objj_msgSend(_functions, "addObject:", jsFunction);
}
}), new objj_method(sel_getUid("executionFunctions"), function(self, _cmd)
{ with(self)
{
    return _functions;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("functionOperationWithFunction:"), function(self, _cmd, jsFunction)
{ with(self)
{
    functionOp = objj_msgSend(objj_msgSend(CPFunctionOperation, "alloc"), "init");
    objj_msgSend(functionOp, "addExecutionFunction:", jsFunction);
    return functionOp;
}
})]);
}

p;12;CPIndexSet.jt;19840;@STATIC;1.0;i;9;CPRange.ji;10;CPObject.jt;19792;objj_executeFile("CPRange.j", true);
objj_executeFile("CPObject.j", true);
{var the_class = objj_allocateClassPair(CPObject, "CPIndexSet"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_count"), new objj_ivar("_ranges")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "initWithIndexesInRange:", { location:(0), length:0 });
}
}), new objj_method(sel_getUid("initWithIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(self, "initWithIndexesInRange:", { location:(anIndex), length:1 });
}
}), new objj_method(sel_getUid("initWithIndexesInRange:"), function(self, _cmd, aRange)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPIndexSet").super_class }, "init");
    if (self)
    {
        _count = MAX(0, aRange.length);
        if (_count > 0)
            _ranges = [aRange];
        else
            _ranges = [];
    }
    return self;
}
}), new objj_method(sel_getUid("initWithIndexSet:"), function(self, _cmd, anIndexSet)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPIndexSet").super_class }, "init");
    if (self)
    {
        _count = objj_msgSend(anIndexSet, "count");
        _ranges = [];
        var otherRanges = anIndexSet._ranges,
            otherRangesCount = otherRanges.length;
        while (otherRangesCount--)
            _ranges[otherRangesCount] = { location:(otherRanges[otherRangesCount]).location, length:(otherRanges[otherRangesCount]).length };
    }
    return self;
}
}), new objj_method(sel_getUid("isEqualToIndexSet:"), function(self, _cmd, anIndexSet)
{ with(self)
{
    if (!anIndexSet)
        return NO;
    if (self === anIndexSet)
       return YES;
    var rangesCount = _ranges.length,
        otherRanges = anIndexSet._ranges;
    if (rangesCount !== otherRanges.length || _count !== anIndexSet._count)
        return NO;
    while (rangesCount--)
        if (!CPEqualRanges(_ranges[rangesCount], otherRanges[rangesCount]))
            return NO;
    return YES;
}
}), new objj_method(sel_getUid("containsIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return positionOfIndex(_ranges, anIndex) !== CPNotFound;
}
}), new objj_method(sel_getUid("containsIndexesInRange:"), function(self, _cmd, aRange)
{ with(self)
{
    if (aRange.length <= 0)
        return NO;
    if(_count < aRange.length)
        return NO;
    var rangeIndex = positionOfIndex(_ranges, aRange.location);
    if (rangeIndex === CPNotFound)
        return NO;
    var range = _ranges[rangeIndex];
    return CPIntersectionRange(range, aRange).length === aRange.length;
}
}), new objj_method(sel_getUid("containsIndexes:"), function(self, _cmd, anIndexSet)
{ with(self)
{
    var otherCount = anIndexSet._count;
    if(otherCount <= 0)
        return YES;
    if (_count < otherCount)
        return NO;
    var otherRanges = anIndexSet._ranges,
        otherRangesCount = otherRanges.length;
    while (otherRangesCount--)
        if (!objj_msgSend(self, "containsIndexesInRange:", otherRanges[otherRangesCount]))
            return NO;
    return YES;
}
}), new objj_method(sel_getUid("intersectsIndexesInRange:"), function(self, _cmd, aRange)
{ with(self)
{
    if (_count <= 0)
        return NO;
    var lhsRangeIndex = assumedPositionOfIndex(_ranges, aRange.location);
    if (FLOOR(lhsRangeIndex) === lhsRangeIndex)
        return YES;
    var rhsRangeIndex = assumedPositionOfIndex(_ranges, ((aRange).location + (aRange).length) - 1);
    if (FLOOR(rhsRangeIndex) === rhsRangeIndex)
        return YES;
    return lhsRangeIndex !== rhsRangeIndex;
}
}), new objj_method(sel_getUid("count"), function(self, _cmd)
{ with(self)
{
    return _count;
}
}), new objj_method(sel_getUid("firstIndex"), function(self, _cmd)
{ with(self)
{
    if (_count > 0)
        return _ranges[0].location;
    return CPNotFound;
}
}), new objj_method(sel_getUid("lastIndex"), function(self, _cmd)
{ with(self)
{
    if (_count > 0)
        return ((_ranges[_ranges.length - 1]).location + (_ranges[_ranges.length - 1]).length) - 1;
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexGreaterThanIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    ++anIndex;
    var rangeIndex = assumedPositionOfIndex(_ranges, anIndex);
    if (rangeIndex === CPNotFound)
        return CPNotFound;
    rangeIndex = CEIL(rangeIndex);
    if (rangeIndex >= _ranges.length)
        return CPNotFound;
    var range = _ranges[rangeIndex];
    if (CPLocationInRange(anIndex, range))
        return anIndex;
    return range.location;
}
}), new objj_method(sel_getUid("indexLessThanIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    --anIndex;
    var rangeIndex = assumedPositionOfIndex(_ranges, anIndex);
    if (rangeIndex === CPNotFound)
        return CPNotFound;
    rangeIndex = FLOOR(rangeIndex);
    if (rangeIndex < 0)
        return CPNotFound;
    var range = _ranges[rangeIndex];
    if (CPLocationInRange(anIndex, range))
        return anIndex;
    return ((range).location + (range).length) - 1;
}
}), new objj_method(sel_getUid("indexGreaterThanOrEqualToIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(self, "indexGreaterThanIndex:", anIndex - 1);
}
}), new objj_method(sel_getUid("indexLessThanOrEqualToIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(self, "indexLessThanIndex:", anIndex + 1);
}
}), new objj_method(sel_getUid("getIndexes:maxCount:inIndexRange:"), function(self, _cmd, anArray, aMaxCount, aRange)
{ with(self)
{
    if (!_count || aMaxCount === 0 || aRange && !aRange.length)
    {
        if (aRange)
            aRange.length = 0;
        return 0;
    }
    var total = 0;
    if (aRange)
    {
        var firstIndex = aRange.location,
            lastIndex = ((aRange).location + (aRange).length) - 1,
            rangeIndex = CEIL(assumedPositionOfIndex(_ranges, firstIndex)),
            lastRangeIndex = FLOOR(assumedPositionOfIndex(_ranges, lastIndex));
    }
    else
    {
        var firstIndex = objj_msgSend(self, "firstIndex"),
            lastIndex = objj_msgSend(self, "lastIndex"),
            rangeIndex = 0,
            lastRangeIndex = _ranges.length - 1;
    }
    while (rangeIndex <= lastRangeIndex)
    {
        var range = _ranges[rangeIndex],
            index = MAX(firstIndex, range.location),
            maxRange = MIN(lastIndex + 1, ((range).location + (range).length));
        for (; index < maxRange; ++index)
        {
            anArray[total++] = index;
            if (total === aMaxCount)
            {
                if (aRange)
                {
                    aRange.location = index + 1;
                    aRange.length = lastIndex + 1 - index - 1;
                }
                return aMaxCount;
            }
        }
        ++rangeIndex;
    }
    if (aRange)
    {
        aRange.location = CPNotFound;
        aRange.length = 0;
    }
    return total;
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    var description = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPIndexSet").super_class }, "description");
    if (_count)
    {
        var index = 0,
            count = _ranges.length;
        description += "[number of indexes: " + _count + " (in " + count;
        if (count === 1)
            description += " range), indexes: (";
        else
            description += " ranges), indexes: (";
        for (; index < count; ++index)
        {
            var range = _ranges[index];
            description += range.location;
            if (range.length > 1)
                description += "-" + (CPMaxRange(range) - 1);
            if (index + 1 < count)
                description += " ";
        }
        description += ")]";
    }
    else
        description += "(no indexes)";
    return description;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("indexSet"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
}), new objj_method(sel_getUid("indexSetWithIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithIndex:", anIndex);
}
}), new objj_method(sel_getUid("indexSetWithIndexesInRange:"), function(self, _cmd, aRange)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithIndexesInRange:", aRange);
}
})]);
}
{
var the_class = objj_getClass("CPIndexSet")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("addIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(self, "addIndexesInRange:", { location:(anIndex), length:1 });
}
}), new objj_method(sel_getUid("addIndexes:"), function(self, _cmd, anIndexSet)
{ with(self)
{
    var otherRanges = anIndexSet._ranges,
        otherRangesCount = otherRanges.length;
    while (otherRangesCount--)
        objj_msgSend(self, "addIndexesInRange:", otherRanges[otherRangesCount]);
}
}), new objj_method(sel_getUid("addIndexesInRange:"), function(self, _cmd, aRange)
{ with(self)
{
    if (aRange.length <= 0)
        return;
    if (_count <= 0)
    {
        _count = aRange.length;
        _ranges = [aRange];
        return;
    }
    var rangeCount = _ranges.length,
        lhsRangeIndex = assumedPositionOfIndex(_ranges, aRange.location - 1),
        lhsRangeIndexCEIL = CEIL(lhsRangeIndex);
    if (lhsRangeIndexCEIL === lhsRangeIndex && lhsRangeIndexCEIL < rangeCount)
        aRange = CPUnionRange(aRange, _ranges[lhsRangeIndexCEIL]);
    var rhsRangeIndex = assumedPositionOfIndex(_ranges, CPMaxRange(aRange)),
        rhsRangeIndexFLOOR = FLOOR(rhsRangeIndex);
    if (rhsRangeIndexFLOOR === rhsRangeIndex && rhsRangeIndexFLOOR >= 0)
        aRange = CPUnionRange(aRange, _ranges[rhsRangeIndexFLOOR]);
    var removalCount = rhsRangeIndexFLOOR - lhsRangeIndexCEIL + 1;
    if (removalCount === _ranges.length)
    {
        _ranges = [aRange];
        _count = aRange.length;
    }
    else if (removalCount === 1)
    {
        if (lhsRangeIndexCEIL < _ranges.length)
            _count -= _ranges[lhsRangeIndexCEIL].length;
        _count += aRange.length;
        _ranges[lhsRangeIndexCEIL] = aRange;
    }
    else
    {
        if (removalCount > 0)
        {
            var removal = lhsRangeIndexCEIL,
                lastRemoval = lhsRangeIndexCEIL + removalCount - 1;
            for (; removal <= lastRemoval; ++removal)
                _count -= _ranges[removal].length;
            objj_msgSend(_ranges, "removeObjectsInRange:", { location:(lhsRangeIndexCEIL), length:removalCount });
        }
        objj_msgSend(_ranges, "insertObject:atIndex:", aRange, lhsRangeIndexCEIL);
        _count += aRange.length;
    }
}
}), new objj_method(sel_getUid("removeIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(self, "removeIndexesInRange:", { location:(anIndex), length:1 });
}
}), new objj_method(sel_getUid("removeIndexes:"), function(self, _cmd, anIndexSet)
{ with(self)
{
    var otherRanges = anIndexSet._ranges,
        otherRangesCount = otherRanges.length;
    while (otherRangesCount--)
        objj_msgSend(self, "removeIndexesInRange:", otherRanges[otherRangesCount]);
}
}), new objj_method(sel_getUid("removeAllIndexes"), function(self, _cmd)
{ with(self)
{
    _ranges = [];
    _count = 0;
}
}), new objj_method(sel_getUid("removeIndexesInRange:"), function(self, _cmd, aRange)
{ with(self)
{
    if (aRange.length <= 0)
        return;
    if (_count <= 0)
        return;
    var rangeCount = _ranges.length,
        lhsRangeIndex = assumedPositionOfIndex(_ranges, aRange.location),
        lhsRangeIndexCEIL = CEIL(lhsRangeIndex);
    if (lhsRangeIndex === lhsRangeIndexCEIL && lhsRangeIndexCEIL < rangeCount)
    {
        var existingRange = _ranges[lhsRangeIndexCEIL];
        if (aRange.location !== existingRange.location)
        {
            var maxRange = CPMaxRange(aRange),
                existingMaxRange = CPMaxRange(existingRange);
            existingRange.length = aRange.location - existingRange.location;
            if (maxRange < existingMaxRange)
            {
                _count -= aRange.length;
                objj_msgSend(_ranges, "insertObject:atIndex:", { location:(maxRange), length:existingMaxRange - maxRange }, lhsRangeIndexCEIL + 1);
                return;
            }
            else
            {
                _count -= existingMaxRange - aRange.location;
                lhsRangeIndexCEIL += 1;
            }
        }
    }
    var rhsRangeIndex = assumedPositionOfIndex(_ranges, CPMaxRange(aRange) - 1),
        rhsRangeIndexFLOOR = FLOOR(rhsRangeIndex);
    if (rhsRangeIndex === rhsRangeIndexFLOOR && rhsRangeIndexFLOOR >= 0)
    {
        var maxRange = CPMaxRange(aRange),
            existingRange = _ranges[rhsRangeIndexFLOOR],
            existingMaxRange = CPMaxRange(existingRange);
        if (maxRange !== existingMaxRange)
        {
            _count -= maxRange - existingRange.location;
            rhsRangeIndexFLOOR -= 1;
            existingRange.location = maxRange;
            existingRange.length = existingMaxRange - maxRange;
        }
    }
    var removalCount = rhsRangeIndexFLOOR - lhsRangeIndexCEIL + 1;
    if (removalCount > 0)
    {
        var removal = lhsRangeIndexCEIL,
            lastRemoval = lhsRangeIndexCEIL + removalCount - 1;
        for (; removal <= lastRemoval; ++removal)
            _count -= _ranges[removal].length;
        objj_msgSend(_ranges, "removeObjectsInRange:", { location:(lhsRangeIndexCEIL), length:removalCount });
    }
}
}), new objj_method(sel_getUid("shiftIndexesStartingAtIndex:by:"), function(self, _cmd, anIndex, aDelta)
{ with(self)
{
    if (!_count || aDelta == 0)
       return;
    var i = _ranges.length - 1,
        shifted = CPMakeRange(CPNotFound, 0);
    for(; i >= 0; --i)
    {
        var range = _ranges[i],
            maximum = CPMaxRange(range);
        if (anIndex > maximum)
            break;
        if (anIndex > range.location && anIndex < maximum)
        {
            shifted = CPMakeRange(anIndex + aDelta, maximum - anIndex);
            range.length = anIndex - range.location;
            if (aDelta > 0)
                objj_msgSend(_ranges, "insertObject:atIndex:", shifted, i + 1);
            else if (shifted.location < 0)
            {
                shifted.length = CPMaxRange(shifted);
                shifted.location = 0;
            }
            break;
        }
        if ((range.location += aDelta) < 0)
        {
            range.length = CPMaxRange(range);
            range.location = 0;
        }
    }
    if (aDelta < 0)
    {
        var j = i + 1,
            count = _ranges.length,
            shifts = [];
        for (; j < count; ++j)
            objj_msgSend(shifts, "addObject:", _ranges[j]);
        if ((j = i + 1) < count)
        {
            objj_msgSend(_ranges, "removeObjectsInRange:", CPMakeRange(j, count - j));
            for (j = 0, count = shifts.length; j < count; ++j)
                objj_msgSend(self, "addIndexesInRange:", shifts[j]);
        }
        if (shifted.location != CPNotFound)
            objj_msgSend(self, "addIndexesInRange:", shifted);
    }
}
})]);
}
var CPIndexSetCountKey = "CPIndexSetCountKey",
    CPIndexSetRangeStringsKey = "CPIndexSetRangeStringsKey";
{
var the_class = objj_getClass("CPIndexSet")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPIndexSet").super_class }, "init");
    if (self)
    {
        _count = objj_msgSend(aCoder, "decodeIntForKey:", CPIndexSetCountKey);
        _ranges = [];
        var rangeStrings = objj_msgSend(aCoder, "decodeObjectForKey:", CPIndexSetRangeStringsKey),
            index = 0,
            count = rangeStrings.length;
        for (; index < count; ++index)
            _ranges.push(CPRangeFromString(rangeStrings[index]));
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeInt:forKey:", _count, CPIndexSetCountKey);
    var index = 0,
        count = _ranges.length,
        rangeStrings = [];
    for (; index < count; ++index)
        rangeStrings[index] = CPStringFromRange(_ranges[index]);
    objj_msgSend(aCoder, "encodeObject:forKey:", rangeStrings, CPIndexSetRangeStringsKey);
}
})]);
}
{
var the_class = objj_getClass("CPIndexSet")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithIndexSet:", self);
}
}), new objj_method(sel_getUid("mutableCopy"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithIndexSet:", self);
}
})]);
}
{
var the_class = objj_getClass("CPIndexSet")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("countByEnumeratingWithState:objects:count:"), function(self, _cmd, aState, objects, aCount)
{ with(self)
{
    var rangeIndex = aState.state;
    if (aState.state >= _ranges.length)
        return 0;
    var range = _ranges[rangeIndex],
        index = 0,
        start = range.location,
        end = start + range.length,
        indexes = new Array(range.length);
    while (start < end)
        indexes[index++] = start++;
    aState.items = indexes;
    ++aState.state;
    return range.length;
}
})]);
}
{var the_class = objj_allocateClassPair(CPIndexSet, "CPMutableIndexSet"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}
var positionOfIndex = function(ranges, anIndex)
{
    var low = 0,
        high = ranges.length - 1;
    while (low <= high)
    {
        var middle = FLOOR(low + (high - low) / 2),
            range = ranges[middle];
        if (anIndex < range.location)
            high = middle - 1;
        else if (anIndex >= CPMaxRange(range))
            low = middle + 1;
        else
            return middle;
   }
   return CPNotFound;
}
var assumedPositionOfIndex = function(ranges, anIndex)
{
    var count = ranges.length;
    if (count <= 0)
        return CPNotFound;
    var low = 0,
        high = count * 2;
    while (low <= high)
    {
        var middle = FLOOR(low + (high - low) / 2),
            position = middle / 2,
            positionFLOOR = FLOOR(position);
        if (position === positionFLOOR)
        {
            if (positionFLOOR - 1 >= 0 && anIndex < CPMaxRange(ranges[positionFLOOR - 1]))
                high = middle - 1;
            else if (positionFLOOR < count && anIndex >= ranges[positionFLOOR].location)
                low = middle + 1;
            else
                return positionFLOOR - 0.5;
        }
        else
        {
            var range = ranges[positionFLOOR];
            if (anIndex < range.location)
                high = middle - 1;
            else if (anIndex >= CPMaxRange(range))
                low = middle + 1;
            else
                return positionFLOOR;
        }
    }
   return CPNotFound;
}

p;14;CPInvocation.jt;3371;@STATIC;1.0;i;10;CPObject.ji;13;CPException.jt;3319;objj_executeFile("CPObject.j", true);
objj_executeFile("CPException.j", true);
{var the_class = objj_allocateClassPair(CPObject, "CPInvocation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_returnValue"), new objj_ivar("_arguments"), new objj_ivar("_methodSignature")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithMethodSignature:"), function(self, _cmd, aMethodSignature)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPInvocation").super_class }, "init");
    if (self)
    {
        _arguments = [];
        _methodSignature = aMethodSignature;
    }
    return self;
}
}), new objj_method(sel_getUid("setSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    _arguments[1] = aSelector;
}
}), new objj_method(sel_getUid("selector"), function(self, _cmd)
{ with(self)
{
    return _arguments[1];
}
}), new objj_method(sel_getUid("setTarget:"), function(self, _cmd, aTarget)
{ with(self)
{
    _arguments[0] = aTarget;
}
}), new objj_method(sel_getUid("target"), function(self, _cmd)
{ with(self)
{
    return _arguments[0];
}
}), new objj_method(sel_getUid("setArgument:atIndex:"), function(self, _cmd, anArgument, anIndex)
{ with(self)
{
    _arguments[anIndex] = anArgument;
}
}), new objj_method(sel_getUid("argumentAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return _arguments[anIndex];
}
}), new objj_method(sel_getUid("setReturnValue:"), function(self, _cmd, aReturnValue)
{ with(self)
{
    _returnValue = aReturnValue;
}
}), new objj_method(sel_getUid("returnValue"), function(self, _cmd)
{ with(self)
{
    return _returnValue;
}
}), new objj_method(sel_getUid("invoke"), function(self, _cmd)
{ with(self)
{
    _returnValue = objj_msgSend.apply(objj_msgSend, _arguments);
}
}), new objj_method(sel_getUid("invokeWithTarget:"), function(self, _cmd, aTarget)
{ with(self)
{
    _arguments[0] = aTarget;
    _returnValue = objj_msgSend.apply(objj_msgSend, _arguments);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("invocationWithMethodSignature:"), function(self, _cmd, aMethodSignature)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithMethodSignature:", aMethodSignature);
}
})]);
}
var CPInvocationArguments = "CPInvocationArguments",
    CPInvocationReturnValue = "CPInvocationReturnValue";
{
var the_class = objj_getClass("CPInvocation")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPInvocation\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPInvocation").super_class }, "init");
    if (self)
    {
        _returnValue = objj_msgSend(aCoder, "decodeObjectForKey:", CPInvocationReturnValue);
        _arguments = objj_msgSend(aCoder, "decodeObjectForKey:", CPInvocationArguments);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _returnValue, CPInvocationReturnValue);
    objj_msgSend(aCoder, "encodeObject:forKey:", _arguments, CPInvocationArguments);
}
})]);
}

p;23;CPInvocationOperation.jt;1838;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Foundation/CPInvocation.ji;13;CPOperation.jt;1745;objj_executeFile("Foundation/CPObject.j", false);
objj_executeFile("Foundation/CPInvocation.j", false);
objj_executeFile("CPOperation.j", true);
{var the_class = objj_allocateClassPair(CPOperation, "CPInvocationOperation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_invocation")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("main"), function(self, _cmd)
{ with(self)
{
    if (_invocation)
    {
        objj_msgSend(_invocation, "invoke");
    }
}
}), new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPInvocationOperation").super_class }, "init"))
    {
        _invocation = nil;
    }
    return self;
}
}), new objj_method(sel_getUid("initWithInvocation:"), function(self, _cmd, inv)
{ with(self)
{
    if (self = objj_msgSend(self, "init"))
    {
        _invocation = inv;
    }
    return self;
}
}), new objj_method(sel_getUid("initWithTarget:selector:object:"), function(self, _cmd, target, sel, arg)
{ with(self)
{
    var inv = objj_msgSend(objj_msgSend(CPInvocation, "alloc"), "initWithMethodSignature:", nil);
    objj_msgSend(inv, "setTarget:", target);
    objj_msgSend(inv, "setSelector:", sel);
    objj_msgSend(inv, "setArgument:atIndex:", arg, 2);
    return objj_msgSend(self, "initWithInvocation:", inv);
}
}), new objj_method(sel_getUid("invocation"), function(self, _cmd)
{ with(self)
{
    return _invocation;
}
}), new objj_method(sel_getUid("result"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "isFinished") && _invocation)
    {
        return objj_msgSend(_invocation, "returnValue");
    }
    return nil;
}
})]);
}

p;19;CPJSONPConnection.jt;4246;@STATIC;1.0;I;21;Foundation/CPObject.jt;4201;objj_executeFile("Foundation/CPObject.j", false);
CPJSONPConnectionCallbacks = {};
CPJSONPCallbackReplacementString = "${JSONP_CALLBACK}";
{var the_class = objj_allocateClassPair(CPObject, "CPJSONPConnection"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_request"), new objj_ivar("_delegate"), new objj_ivar("_callbackParameter"), new objj_ivar("_scriptTag")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithRequest:callback:delegate:"), function(self, _cmd, aRequest, aString, aDelegate)
{ with(self)
{
    return objj_msgSend(self, "initWithRequest:callback:delegate:startImmediately:", aRequest, aString, aDelegate,  NO);
}
}), new objj_method(sel_getUid("initWithRequest:callback:delegate:startImmediately:"), function(self, _cmd, aRequest, aString, aDelegate, shouldStartImmediately)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPJSONPConnection").super_class }, "init");
    _request = aRequest;
    _delegate = aDelegate;
    _callbackParameter = aString;
    if (!_callbackParameter && objj_msgSend(objj_msgSend(_request, "URL"), "absoluteString").indexOf(CPJSONPCallbackReplacementString) < 0)
         objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "JSONP source specified without callback parameter or CPJSONPCallbackReplacementString in URL.");
    if(shouldStartImmediately)
        objj_msgSend(self, "start");
    return self;
}
}), new objj_method(sel_getUid("start"), function(self, _cmd)
{ with(self)
{
    try
    {
        CPJSONPConnectionCallbacks["callback"+objj_msgSend(self, "UID")] = function(data)
        {
            objj_msgSend(_delegate, "connection:didReceiveData:", self, data);
            objj_msgSend(self, "removeScriptTag");
            objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
        };
        var head = document.getElementsByTagName("head").item(0),
            source = objj_msgSend(objj_msgSend(_request, "URL"), "absoluteString");
        if (_callbackParameter)
        {
            source += (source.indexOf('?') < 0) ? "?" : "&";
            source += _callbackParameter+"=CPJSONPConnectionCallbacks.callback"+objj_msgSend(self, "UID");
        }
        else if (source.indexOf(CPJSONPCallbackReplacementString) >= 0)
        {
            source = objj_msgSend(source, "stringByReplacingOccurrencesOfString:withString:", CPJSONPCallbackReplacementString, "CPJSONPConnectionCallbacks.callback"+objj_msgSend(self, "UID"));
        }
        else
            return;
        _scriptTag = document.createElement("script");
        _scriptTag.setAttribute("type", "text/javascript");
        _scriptTag.setAttribute("charset", "utf-8");
        _scriptTag.setAttribute("src", source);
        head.appendChild(_scriptTag);
    }
    catch (exception)
    {
        objj_msgSend(_delegate, "connection:didFailWithError:",  self,  exception);
        objj_msgSend(self, "removeScriptTag");
    }
}
}), new objj_method(sel_getUid("removeScriptTag"), function(self, _cmd)
{ with(self)
{
    var head = document.getElementsByTagName("head").item(0);
    if(_scriptTag && _scriptTag.parentNode == head)
        head.removeChild(_scriptTag);
    CPJSONPConnectionCallbacks["callback"+objj_msgSend(self, "UID")] = nil;
    delete CPJSONPConnectionCallbacks["callback"+objj_msgSend(self, "UID")];
}
}), new objj_method(sel_getUid("cancel"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "removeScriptTag");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sendRequest:callback:delegate:"), function(self, _cmd, aRequest, callbackParameter, aDelegate)
{ with(self)
{
    return objj_msgSend(self, "connectionWithRequest:callback:delegate:", aRequest, callbackParameter, aDelegate);
}
}), new objj_method(sel_getUid("connectionWithRequest:callback:delegate:"), function(self, _cmd, aRequest, callbackParameter, aDelegate)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithRequest:callback:delegate:startImmediately:", aRequest, callbackParameter, aDelegate, YES);;
}
})]);
}

p;17;CPKeyedArchiver.jt;15369;@STATIC;1.0;i;8;CPData.ji;9;CPCoder.ji;9;CPArray.ji;10;CPString.ji;10;CPNumber.ji;14;CPDictionary.ji;9;CPValue.jt;15249;objj_executeFile("CPData.j", true);
objj_executeFile("CPCoder.j", true);
objj_executeFile("CPArray.j", true);
objj_executeFile("CPString.j", true);
objj_executeFile("CPNumber.j", true);
objj_executeFile("CPDictionary.j", true);
objj_executeFile("CPValue.j", true);
var CPArchiverReplacementClassNames = nil;
var _CPKeyedArchiverDidEncodeObjectSelector = 1,
    _CPKeyedArchiverWillEncodeObjectSelector = 2,
    _CPKeyedArchiverWillReplaceObjectWithObjectSelector = 4,
    _CPKeyedArchiverDidFinishSelector = 8,
    _CPKeyedArchiverWillFinishSelector = 16;
var _CPKeyedArchiverNullString = "$null",
    _CPKeyedArchiverNullReference = nil,
    _CPKeyedArchiverUIDKey = "CP$UID",
    _CPKeyedArchiverTopKey = "$top",
    _CPKeyedArchiverObjectsKey = "$objects",
    _CPKeyedArchiverArchiverKey = "$archiver",
    _CPKeyedArchiverVersionKey = "$version",
    _CPKeyedArchiverClassNameKey = "$classname",
    _CPKeyedArchiverClassesKey = "$classes",
    _CPKeyedArchiverClassKey = "$class";
var _CPKeyedArchiverStringClass = Nil,
    _CPKeyedArchiverNumberClass = Nil;
{var the_class = objj_allocateClassPair(CPValue, "_CPKeyedArchiverValue"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}
{var the_class = objj_allocateClassPair(CPCoder, "CPKeyedArchiver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_delegate"), new objj_ivar("_delegateSelectors"), new objj_ivar("_data"), new objj_ivar("_objects"), new objj_ivar("_UIDs"), new objj_ivar("_conditionalUIDs"), new objj_ivar("_replacementObjects"), new objj_ivar("_replacementClassNames"), new objj_ivar("_plistObject"), new objj_ivar("_plistObjects"), new objj_ivar("_outputFormat")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initForWritingWithMutableData:"), function(self, _cmd, data)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPKeyedArchiver").super_class }, "init");
    if (self)
    {
        _data = data;
        _objects = [];
        _UIDs = objj_msgSend(CPDictionary, "dictionary");
        _conditionalUIDs = objj_msgSend(CPDictionary, "dictionary");
        _replacementObjects = objj_msgSend(CPDictionary, "dictionary");
        _data = data;
        _plistObject = objj_msgSend(CPDictionary, "dictionary");
        _plistObjects = objj_msgSend(CPArray, "arrayWithObject:", _CPKeyedArchiverNullString);
    }
    return self;
}
}), new objj_method(sel_getUid("finishEncoding"), function(self, _cmd)
{ with(self)
{
    if (_delegate && _delegateSelectors & _CPKeyedArchiverWillFinishSelector)
        objj_msgSend(_delegate, "archiverWillFinish:", self);
    var i = 0,
        topObject = _plistObject,
        classes = [];
    for (; i < _objects.length; ++i)
    {
        var object = _objects[i],
            theClass = objj_msgSend(object, "classForKeyedArchiver");
        _plistObject = _plistObjects[objj_msgSend(_UIDs, "objectForKey:", objj_msgSend(object, "UID"))];
        objj_msgSend(object, "encodeWithCoder:", self);
        if (_delegate && _delegateSelectors & _CPKeyedArchiverDidEncodeObjectSelector)
            objj_msgSend(_delegate, "archiver:didEncodeObject:", self, object);
    }
    _plistObject = objj_msgSend(CPDictionary, "dictionary");
    objj_msgSend(_plistObject, "setObject:forKey:", topObject, _CPKeyedArchiverTopKey);
    objj_msgSend(_plistObject, "setObject:forKey:", _plistObjects, _CPKeyedArchiverObjectsKey);
    objj_msgSend(_plistObject, "setObject:forKey:", objj_msgSend(self, "className"), _CPKeyedArchiverArchiverKey);
    objj_msgSend(_plistObject, "setObject:forKey:", "100000", _CPKeyedArchiverVersionKey);
    objj_msgSend(_data, "setSerializedPlistObject:", _plistObject);
    if (_delegate && _delegateSelectors & _CPKeyedArchiverDidFinishSelector)
        objj_msgSend(_delegate, "archiverDidFinish:", self);
}
}), new objj_method(sel_getUid("outputFormat"), function(self, _cmd)
{ with(self)
{
    return _outputFormat;
}
}), new objj_method(sel_getUid("setOutputFormat:"), function(self, _cmd, aPropertyListFormat)
{ with(self)
{
    _outputFormat = aPropertyListFormat;
}
}), new objj_method(sel_getUid("encodeBool:forKey:"), function(self, _cmd, aBOOL, aKey)
{ with(self)
{
    objj_msgSend(_plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, aBOOL, NO), aKey);
}
}), new objj_method(sel_getUid("encodeDouble:forKey:"), function(self, _cmd, aDouble, aKey)
{ with(self)
{
    objj_msgSend(_plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, aDouble, NO), aKey);
}
}), new objj_method(sel_getUid("encodeFloat:forKey:"), function(self, _cmd, aFloat, aKey)
{ with(self)
{
    objj_msgSend(_plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, aFloat, NO), aKey);
}
}), new objj_method(sel_getUid("encodeInt:forKey:"), function(self, _cmd, anInt, aKey)
{ with(self)
{
    objj_msgSend(_plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, anInt, NO), aKey);
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("archiver:didEncodeObject:")))
        _delegateSelectors |= _CPKeyedArchiverDidEncodeObjectSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("archiver:willEncodeObject:")))
        _delegateSelectors |= _CPKeyedArchiverWillEncodeObjectSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("archiver:willReplaceObject:withObject:")))
        _delegateSelectors |= _CPKeyedArchiverWillReplaceObjectWithObjectSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("archiver:didFinishEncoding:")))
        _delegateSelectors |= _CPKeyedArchiverDidFinishEncodingSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("archiver:willFinishEncoding:")))
        _delegateSelectors |= _CPKeyedArchiverWillFinishEncodingSelector;
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("encodePoint:forKey:"), function(self, _cmd, aPoint, aKey)
{ with(self)
{
    objj_msgSend(_plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, CPStringFromPoint(aPoint), NO), aKey);
}
}), new objj_method(sel_getUid("encodeRect:forKey:"), function(self, _cmd, aRect, aKey)
{ with(self)
{
    objj_msgSend(_plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, CPStringFromRect(aRect), NO), aKey);
}
}), new objj_method(sel_getUid("encodeSize:forKey:"), function(self, _cmd, aSize, aKey)
{ with(self)
{
    objj_msgSend(_plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, CPStringFromSize(aSize), NO), aKey);
}
}), new objj_method(sel_getUid("encodeConditionalObject:forKey:"), function(self, _cmd, anObject, aKey)
{ with(self)
{
    objj_msgSend(_plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, anObject, YES), aKey);
}
}), new objj_method(sel_getUid("encodeNumber:forKey:"), function(self, _cmd, aNumber, aKey)
{ with(self)
{
    objj_msgSend(_plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, aNumber, NO), aKey);
}
}), new objj_method(sel_getUid("encodeObject:forKey:"), function(self, _cmd, anObject, aKey)
{ with(self)
{
    objj_msgSend(_plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, anObject, NO), aKey);
}
}), new objj_method(sel_getUid("_encodeArrayOfObjects:forKey:"), function(self, _cmd, objects, aKey)
{ with(self)
{
    var i = 0,
        count = objects.length,
        references = objj_msgSend(CPArray, "arrayWithCapacity:", count);
    for (; i < count; ++i)
        objj_msgSend(references, "addObject:", _CPKeyedArchiverEncodeObject(self, objects[i], NO));
    objj_msgSend(_plistObject, "setObject:forKey:", references, aKey);
}
}), new objj_method(sel_getUid("_encodeDictionaryOfObjects:forKey:"), function(self, _cmd, aDictionary, aKey)
{ with(self)
{
    var key,
        keys = objj_msgSend(aDictionary, "keyEnumerator"),
        references = objj_msgSend(CPDictionary, "dictionary");
    while (key = objj_msgSend(keys, "nextObject"))
        objj_msgSend(references, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, objj_msgSend(aDictionary, "objectForKey:", key), NO), key);
    objj_msgSend(_plistObject, "setObject:forKey:", references, aKey);
}
}), new objj_method(sel_getUid("setClassName:forClass:"), function(self, _cmd, aClassName, aClass)
{ with(self)
{
    if (!_replacementClassNames)
        _replacementClassNames = objj_msgSend(CPDictionary, "dictionary");
    objj_msgSend(_replacementClassNames, "setObject:forKey:", aClassName, CPStringFromClass(aClass));
}
}), new objj_method(sel_getUid("classNameForClass:"), function(self, _cmd, aClass)
{ with(self)
{
    if (!_replacementClassNames)
        return aClass.name;
    var className = objj_msgSend(_replacementClassNames, "objectForKey:", CPStringFromClass(aClassName));
    return className ? className : aClass.name;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPKeyedArchiver, "class"))
        return;
    _CPKeyedArchiverStringClass = objj_msgSend(CPString, "class");
    _CPKeyedArchiverNumberClass = objj_msgSend(CPNumber, "class");
    _CPKeyedArchiverNullReference = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", 0, _CPKeyedArchiverUIDKey);
}
}), new objj_method(sel_getUid("allowsKeyedCoding"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("archivedDataWithRootObject:"), function(self, _cmd, anObject)
{ with(self)
{
    var data = objj_msgSend(CPData, "dataWithSerializedPlistObject:", nil),
        archiver = objj_msgSend(objj_msgSend(self, "alloc"), "initForWritingWithMutableData:", data);
    objj_msgSend(archiver, "encodeObject:forKey:", anObject, "root");
    objj_msgSend(archiver, "finishEncoding");
    return data;
}
}), new objj_method(sel_getUid("setClassName:forClass:"), function(self, _cmd, aClassName, aClass)
{ with(self)
{
    if (!CPArchiverReplacementClassNames)
        CPArchiverReplacementClassNames = objj_msgSend(CPDictionary, "dictionary");
    objj_msgSend(CPArchiverReplacementClassNames, "setObject:forKey:", aClassName, CPStringFromClass(aClass));
}
}), new objj_method(sel_getUid("classNameForClass:"), function(self, _cmd, aClass)
{ with(self)
{
    if (!CPArchiverReplacementClassNames)
        return aClass.name;
    var className = objj_msgSend(CPArchiverReplacementClassNames, "objectForKey:", CPStringFromClass(aClassName));
    return className ? className : aClass.name;
}
})]);
}
var _CPKeyedArchiverEncodeObject = function(self, anObject, isConditional)
{
    if (anObject !== nil && !anObject.isa)
        anObject = objj_msgSend(_CPKeyedArchiverValue, "valueWithJSObject:", anObject);
    var GUID = objj_msgSend(anObject, "UID"),
        object = objj_msgSend(self._replacementObjects, "objectForKey:", GUID);
    if (object === nil)
    {
        object = objj_msgSend(anObject, "replacementObjectForKeyedArchiver:", self);
        if (self._delegate)
        {
            if (object !== anObject && self._delegateSelectors & _CPKeyedArchiverWillReplaceObjectWithObjectSelector)
                objj_msgSend(self._delegate, "archiver:willReplaceObject:withObject:", self, anObject, object);
            if (self._delegateSelectors & _CPKeyedArchiverWillEncodeObjectSelector)
            {
                anObject = objj_msgSend(self._delegate, "archiver:willEncodeObject:", self, object);
                if (anObject !== object && self._delegateSelectors & _CPKeyedArchiverWillReplaceObjectWithObjectSelector)
                    objj_msgSend(self._delegate, "archiver:willReplaceObject:withObject:", self, object, anObject);
                object = anObject;
            }
        }
        objj_msgSend(self._replacementObjects, "setObject:forKey:", object, GUID);
    }
    if (object === nil)
        return _CPKeyedArchiverNullReference;
    var UID = objj_msgSend(self._UIDs, "objectForKey:", GUID = objj_msgSend(object, "UID"));
    if (UID === nil)
    {
        if (isConditional)
        {
            if ((UID = objj_msgSend(self._conditionalUIDs, "objectForKey:", GUID)) === nil)
            {
                objj_msgSend(self._conditionalUIDs, "setObject:forKey:", UID = objj_msgSend(self._plistObjects, "count"), GUID);
                objj_msgSend(self._plistObjects, "addObject:", _CPKeyedArchiverNullString);
            }
        }
        else
        {
            var theClass = objj_msgSend(object, "classForKeyedArchiver"),
                plistObject = nil;
            if ((theClass === _CPKeyedArchiverStringClass) || (theClass === _CPKeyedArchiverNumberClass))
                plistObject = object;
            else
            {
                plistObject = objj_msgSend(CPDictionary, "dictionary");
                objj_msgSend(self._objects, "addObject:", object);
                var className = objj_msgSend(self, "classNameForClass:", theClass);
                if (!className)
                    className = objj_msgSend(objj_msgSend(self, "class"), "classNameForClass:", theClass);
                if (!className)
                    className = theClass.name;
                else
                    theClass = CPClassFromString(className);
                var classUID = objj_msgSend(self._UIDs, "objectForKey:", className);
                if (!classUID)
                {
                    var plistClass = objj_msgSend(CPDictionary, "dictionary"),
                        hierarchy = [];
                    objj_msgSend(plistClass, "setObject:forKey:", className, _CPKeyedArchiverClassNameKey);
                    do
                    {
                        objj_msgSend(hierarchy, "addObject:", CPStringFromClass(theClass));
                    } while (theClass = objj_msgSend(theClass, "superclass"));
                    objj_msgSend(plistClass, "setObject:forKey:", hierarchy, _CPKeyedArchiverClassesKey);
                    classUID = objj_msgSend(self._plistObjects, "count");
                    objj_msgSend(self._plistObjects, "addObject:", plistClass);
                    objj_msgSend(self._UIDs, "setObject:forKey:", classUID, className);
                }
                objj_msgSend(plistObject, "setObject:forKey:", objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", classUID, _CPKeyedArchiverUIDKey), _CPKeyedArchiverClassKey);
            }
            UID = objj_msgSend(self._conditionalUIDs, "objectForKey:", GUID);
            if (UID !== nil)
            {
                objj_msgSend(self._UIDs, "setObject:forKey:", UID, GUID);
                objj_msgSend(self._plistObjects, "replaceObjectAtIndex:withObject:", UID, plistObject);
            }
            else
            {
                objj_msgSend(self._UIDs, "setObject:forKey:", UID = objj_msgSend(self._plistObjects, "count"), GUID);
                objj_msgSend(self._plistObjects, "addObject:", plistObject);
            }
        }
    }
    return objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", UID, _CPKeyedArchiverUIDKey);
}

p;19;CPKeyedUnarchiver.jt;13161;@STATIC;1.0;i;9;CPCoder.ji;8;CPNull.jt;13116;objj_executeFile("CPCoder.j", true);
objj_executeFile("CPNull.j", true);
CPInvalidUnarchiveOperationException = "CPInvalidUnarchiveOperationException";
var _CPKeyedUnarchiverCannotDecodeObjectOfClassNameOriginalClassesSelector = 1 << 0,
    _CPKeyedUnarchiverDidDecodeObjectSelector = 1 << 1,
    _CPKeyedUnarchiverWillReplaceObjectWithObjectSelector = 1 << 2,
    _CPKeyedUnarchiverWillFinishSelector = 1 << 3,
    _CPKeyedUnarchiverDidFinishSelector = 1 << 4,
    CPKeyedUnarchiverDelegate_unarchiver_cannotDecodeObjectOfClassName_originalClasses_ = 1 << 5;
var _CPKeyedArchiverNullString = "$null"
    _CPKeyedArchiverUIDKey = "CP$UID",
    _CPKeyedArchiverTopKey = "$top",
    _CPKeyedArchiverObjectsKey = "$objects",
    _CPKeyedArchiverArchiverKey = "$archiver",
    _CPKeyedArchiverVersionKey = "$version",
    _CPKeyedArchiverClassNameKey = "$classname",
    _CPKeyedArchiverClassesKey = "$classes",
    _CPKeyedArchiverClassKey = "$class";
var _CPKeyedUnarchiverArrayClass = Nil,
    _CPKeyedUnarchiverStringClass = Nil,
    _CPKeyedUnarchiverDictionaryClass = Nil,
    _CPKeyedUnarchiverNumberClass = Nil,
    _CPKeyedUnarchiverDataClass = Nil,
    _CPKeyedUnarchiverArchiverValueClass = Nil;
{var the_class = objj_allocateClassPair(CPCoder, "CPKeyedUnarchiver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_delegate"), new objj_ivar("_delegateSelectors"), new objj_ivar("_data"), new objj_ivar("_replacementClasses"), new objj_ivar("_objects"), new objj_ivar("_archive"), new objj_ivar("_plistObject"), new objj_ivar("_plistObjects")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initForReadingWithData:"), function(self, _cmd, data)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPKeyedUnarchiver").super_class }, "init");
    if (self)
    {
        _archive = objj_msgSend(data, "serializedPlistObject");
        _objects = objj_msgSend(CPArray, "arrayWithObject:", objj_msgSend(CPNull, "null"));
        _plistObject = objj_msgSend(_archive, "objectForKey:", _CPKeyedArchiverTopKey);
        _plistObjects = objj_msgSend(_archive, "objectForKey:", _CPKeyedArchiverObjectsKey);
        _replacementClasses = objj_msgSend(CPDictionary, "dictionary");
    }
    return self;
}
}), new objj_method(sel_getUid("containsValueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    return objj_msgSend(_plistObject, "objectForKey:", aKey) != nil;
}
}), new objj_method(sel_getUid("_decodeDictionaryOfObjectsForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    var object = objj_msgSend(_plistObject, "objectForKey:", aKey);
    if (objj_msgSend(object, "isKindOfClass:", _CPKeyedUnarchiverDictionaryClass))
    {
        var key,
            keys = objj_msgSend(object, "keyEnumerator"),
            dictionary = objj_msgSend(CPDictionary, "dictionary");
        while (key = objj_msgSend(keys, "nextObject"))
            objj_msgSend(dictionary, "setObject:forKey:", _CPKeyedUnarchiverDecodeObjectAtIndex(self, objj_msgSend(objj_msgSend(object, "objectForKey:", key), "objectForKey:", _CPKeyedArchiverUIDKey)), key);
        return dictionary;
    }
    return nil;
}
}), new objj_method(sel_getUid("decodeBoolForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    return objj_msgSend(self, "decodeObjectForKey:", aKey);
}
}), new objj_method(sel_getUid("decodeFloatForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    return objj_msgSend(self, "decodeObjectForKey:", aKey);
}
}), new objj_method(sel_getUid("decodeDoubleForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    return objj_msgSend(self, "decodeObjectForKey:", aKey);
}
}), new objj_method(sel_getUid("decodeIntForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    return objj_msgSend(self, "decodeObjectForKey:", aKey);
}
}), new objj_method(sel_getUid("decodePointForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    var object = objj_msgSend(self, "decodeObjectForKey:", aKey);
    if(object)
        return CPPointFromString(object);
    else
        return CPPointMake(0.0, 0.0);
}
}), new objj_method(sel_getUid("decodeRectForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    var object = objj_msgSend(self, "decodeObjectForKey:", aKey);
    if(object)
        return CPRectFromString(object);
    else
        return CPRectMakeZero();
}
}), new objj_method(sel_getUid("decodeSizeForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    var object = objj_msgSend(self, "decodeObjectForKey:", aKey);
    if(object)
        return CPSizeFromString(object);
    else
        return CPSizeMake(0.0, 0.0);
}
}), new objj_method(sel_getUid("decodeObjectForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    var object = objj_msgSend(_plistObject, "objectForKey:", aKey);
    if (objj_msgSend(object, "isKindOfClass:", _CPKeyedUnarchiverDictionaryClass))
        return _CPKeyedUnarchiverDecodeObjectAtIndex(self, objj_msgSend(object, "objectForKey:", _CPKeyedArchiverUIDKey));
    else if (objj_msgSend(object, "isKindOfClass:", _CPKeyedUnarchiverNumberClass) || objj_msgSend(object, "isKindOfClass:", _CPKeyedUnarchiverDataClass) || objj_msgSend(object, "isKindOfClass:", _CPKeyedUnarchiverStringClass))
        return object;
    else if (objj_msgSend(object, "isKindOfClass:", _CPKeyedUnarchiverArrayClass))
    {
        var index = 0,
            count = object.length,
            array = [];
        for (; index < count; ++index)
            array[index] = _CPKeyedUnarchiverDecodeObjectAtIndex(self, objj_msgSend(object[index], "objectForKey:", _CPKeyedArchiverUIDKey));
        return array;
    }
    return nil;
}
}), new objj_method(sel_getUid("decodeBytesForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    var data = objj_msgSend(self, "decodeObjectForKey:", aKey);
    if (objj_msgSend(data, "isKindOfClass:", objj_msgSend(CPData, "class")))
        return data.bytes;
    return nil;
}
}), new objj_method(sel_getUid("finishDecoding"), function(self, _cmd)
{ with(self)
{
    if (_delegateSelectors & _CPKeyedUnarchiverWillFinishSelector)
        objj_msgSend(_delegate, "unarchiverWillFinish:", self);
    if (_delegateSelectors & _CPKeyedUnarchiverDidFinishSelector)
        objj_msgSend(_delegate, "unarchiverDidFinish:", self);
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("unarchiver:cannotDecodeObjectOfClassName:originalClasses:")))
        _delegateSelectors |= _CPKeyedUnarchiverCannotDecodeObjectOfClassNameOriginalClassesSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("unarchiver:didDecodeObject:")))
        _delegateSelectors |= _CPKeyedUnarchiverDidDecodeObjectSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("unarchiver:willReplaceObject:withObject:")))
        _delegateSelectors |= _CPKeyedUnarchiverWillReplaceObjectWithObjectSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("unarchiverWillFinish:")))
        _delegateSelectors |= _CPKeyedUnarchiverWilFinishSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("unarchiverDidFinish:")))
        _delegateSelectors |= _CPKeyedUnarchiverDidFinishSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("unarchiver:cannotDecodeObjectOfClassName:originalClasses:")))
        _delegateSelectors |= CPKeyedUnarchiverDelegate_unarchiver_cannotDecodeObjectOfClassName_originalClasses_;
}
}), new objj_method(sel_getUid("setClass:forClassName:"), function(self, _cmd, aClass, aClassName)
{ with(self)
{
    objj_msgSend(_replacementClasses, "setObject:forKey:", aClass, aClassName);
}
}), new objj_method(sel_getUid("classForClassName:"), function(self, _cmd, aClassName)
{ with(self)
{
    return objj_msgSend(_replacementClasses, "objectForKey:", aClassName);
}
}), new objj_method(sel_getUid("allowsKeyedCoding"), function(self, _cmd)
{ with(self)
{
    return YES;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self !== objj_msgSend(CPKeyedUnarchiver, "class"))
        return;
    _CPKeyedUnarchiverArrayClass = objj_msgSend(CPArray, "class");
    _CPKeyedUnarchiverStringClass = objj_msgSend(CPString, "class");
    _CPKeyedUnarchiverDictionaryClass = objj_msgSend(CPDictionary, "class");
    _CPKeyedUnarchiverNumberClass = objj_msgSend(CPNumber, "class");
    _CPKeyedUnarchiverDataClass = objj_msgSend(CPData, "class");
    _CPKeyedUnarchiverArchiverValueClass = objj_msgSend(_CPKeyedArchiverValue, "class");
}
}), new objj_method(sel_getUid("unarchiveObjectWithData:"), function(self, _cmd, data)
{ with(self)
{
    var unarchiver = objj_msgSend(objj_msgSend(self, "alloc"), "initForReadingWithData:", data),
        object = objj_msgSend(unarchiver, "decodeObjectForKey:", "root");
    objj_msgSend(unarchiver, "finishDecoding");
    return object;
}
}), new objj_method(sel_getUid("unarchiveObjectWithFile:"), function(self, _cmd, aFilePath)
{ with(self)
{
}
}), new objj_method(sel_getUid("unarchiveObjectWithFile:asynchronously:"), function(self, _cmd, aFilePath, aFlag)
{ with(self)
{
}
})]);
}
var _CPKeyedUnarchiverDecodeObjectAtIndex = function(self, anIndex)
{
    var object = self._objects[anIndex];
    if (object)
        if (object == self._objects[0])
            return nil;
        else
            return object;
    var object,
        plistObject = self._plistObjects[anIndex];
    if (objj_msgSend(plistObject, "isKindOfClass:", _CPKeyedUnarchiverDictionaryClass))
    {
        var plistClass = self._plistObjects[objj_msgSend(objj_msgSend(plistObject, "objectForKey:", _CPKeyedArchiverClassKey), "objectForKey:", _CPKeyedArchiverUIDKey)],
            className = objj_msgSend(plistClass, "objectForKey:", _CPKeyedArchiverClassNameKey),
            classes = objj_msgSend(plistClass, "objectForKey:", _CPKeyedArchiverClassesKey),
            theClass = objj_msgSend(self, "classForClassName:", className);
        if (!theClass)
            theClass = CPClassFromString(className);
        if (!theClass && (self._delegateSelectors & CPKeyedUnarchiverDelegate_unarchiver_cannotDecodeObjectOfClassName_originalClasses_))
            theClass = objj_msgSend(_delegate, "unarchiver:cannotDecodeObjectOfClassName:originalClasses:", self, className, classes);
        if (!theClass)
            objj_msgSend(CPException, "raise:reason:", CPInvalidUnarchiveOperationException, "-[CPKeyedUnarchiver decodeObjectForKey:]: cannot decode object of class (" + className + ")");
        var savedPlistObject = self._plistObject;
        self._plistObject = plistObject;
        object = objj_msgSend(theClass, "allocWithCoder:", self);
        self._objects[anIndex] = object;
        var processedObject = objj_msgSend(object, "initWithCoder:", self);
        self._plistObject = savedPlistObject;
        if (processedObject != object)
        {
            if (self._delegateSelectors & _CPKeyedUnarchiverWillReplaceObjectWithObjectSelector)
                objj_msgSend(self._delegate, "unarchiver:willReplaceObject:withObject:", self, object, processedObject);
            object = processedObject;
            self._objects[anIndex] = processedObject;
        }
        processedObject = objj_msgSend(object, "awakeAfterUsingCoder:", self);
        if (processedObject != object)
        {
            if (self._delegateSelectors & _CPKeyedUnarchiverWillReplaceObjectWithObjectSelector)
                objj_msgSend(self._delegate, "unarchiver:willReplaceObject:withObject:", self, object, processedObject);
            object = processedObject;
            self._objects[anIndex] = processedObject;
        }
        if (self._delegate)
        {
            if (self._delegateSelectors & _CPKeyedUnarchiverDidDecodeObjectSelector)
                processedObject = objj_msgSend(self._delegate, "unarchiver:didDecodeObject:", self, object);
            if (processedObject != object)
            {
                if (self._delegateSelectors & _CPKeyedUnarchiverWillReplaceObjectWithObjectSelector)
                    objj_msgSend(self._delegate, "unarchiver:willReplaceObject:withObject:", self, object, processedObject);
                object = processedObject;
                self._objects[anIndex] = processedObject;
            }
        }
    }
    else
    {
        self._objects[anIndex] = object = plistObject;
        if (objj_msgSend(object, "class") == _CPKeyedUnarchiverStringClass)
        {
            if (object == _CPKeyedArchiverNullString)
            {
                self._objects[anIndex] = self._objects[0];
                return nil;
            }
            else
                self._objects[anIndex] = object = plistObject;
        }
    }
    if (objj_msgSend(object, "isMemberOfClass:", _CPKeyedUnarchiverArchiverValueClass))
        object = objj_msgSend(object, "JSObject");
    return object;
}

p;18;CPKeyValueCoding.jt;8560;@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;8;CPNull.ji;10;CPObject.ji;13;CPArray+KVO.jt;8464;objj_executeFile("CPArray.j", true);
objj_executeFile("CPDictionary.j", true);
objj_executeFile("CPNull.j", true);
objj_executeFile("CPObject.j", true);
var CPObjectAccessorsForClass = nil,
    CPObjectModifiersForClass = nil;
CPUndefinedKeyException = "CPUndefinedKeyException";
CPTargetObjectUserInfoKey = "CPTargetObjectUserInfoKey";
CPUnknownUserInfoKey = "CPUnknownUserInfoKey";
{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_ivarForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    var ivar = '_' + aKey;
    if (typeof self[ivar] != "undefined")
        return ivar;
    var isKey = "is" + aKey.charAt(0).toUpperCase() + aKey.substr(1);
    ivar = '_' + isKey;
    if (typeof self[ivar] != "undefined")
        return ivar;
    ivar = aKey;
    if (typeof self[ivar] != "undefined")
        return ivar;
    ivar = isKey;
    if (typeof self[ivar] != "undefined")
        return ivar;
    return nil;
}
}), new objj_method(sel_getUid("valueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    var theClass = objj_msgSend(self, "class"),
        selector = objj_msgSend(theClass, "_accessorForKey:", aKey);
    if (selector)
        return objj_msgSend(self, selector);
    if(objj_msgSend(theClass, "accessInstanceVariablesDirectly"))
    {
        var ivar = objj_msgSend(self, "_ivarForKey:", aKey);
        if (ivar)
            return self[ivar];
    }
    return objj_msgSend(self, "valueForUndefinedKey:", aKey);
}
}), new objj_method(sel_getUid("valueForKeyPath:"), function(self, _cmd, aKeyPath)
{ with(self)
{
    var firstDotIndex = aKeyPath.indexOf(".");
    if (firstDotIndex === -1)
        return objj_msgSend(self, "valueForKey:", aKeyPath);
    var firstKeyComponent = aKeyPath.substring(0, firstDotIndex),
        remainingKeyPath = aKeyPath.substring(firstDotIndex+1),
        value = objj_msgSend(self, "valueForKey:", firstKeyComponent);
    return objj_msgSend(value, "valueForKeyPath:", remainingKeyPath);
}
}), new objj_method(sel_getUid("dictionaryWithValuesForKeys:"), function(self, _cmd, keys)
{ with(self)
{
    var index = 0,
        count = keys.length,
        dictionary = objj_msgSend(CPDictionary, "dictionary");
    for (; index < count; ++index)
    {
        var key = keys[index],
            value = objj_msgSend(self, "valueForKey:", key);
        if (value === nil)
            objj_msgSend(dictionary, "setObject:forKey:", objj_msgSend(CPNull, "null"), key);
        else
            objj_msgSend(dictionary, "setObject:forKey:", value, key);
    }
    return dictionary;
}
}), new objj_method(sel_getUid("valueForUndefinedKey:"), function(self, _cmd, aKey)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPException, "exceptionWithName:reason:userInfo:", CPUndefinedKeyException, objj_msgSend(self, "description") + " is not key value coding-compliant for the key " + aKey, objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [self, aKey], [CPTargetObjectUserInfoKey, CPUnknownUserInfoKey])), "raise");
}
}), new objj_method(sel_getUid("setValue:forKeyPath:"), function(self, _cmd, aValue, aKeyPath)
{ with(self)
{
    if (!aKeyPath) aKeyPath = "self";
    var i = 0,
        keys = aKeyPath.split("."),
        count = keys.length - 1,
        owner = self;
    for(; i < count; ++i)
        owner = objj_msgSend(owner, "valueForKey:", keys[i]);
    objj_msgSend(owner, "setValue:forKey:", aValue, keys[i]);
}
}), new objj_method(sel_getUid("setValue:forKey:"), function(self, _cmd, aValue, aKey)
{ with(self)
{
    var theClass = objj_msgSend(self, "class"),
        selector = objj_msgSend(theClass, "_modifierForKey:", aKey);
    if (selector)
        return objj_msgSend(self, selector, aValue);
    if(objj_msgSend(theClass, "accessInstanceVariablesDirectly"))
    {
        var ivar = objj_msgSend(self, "_ivarForKey:", aKey);
        if (ivar)
        {
            objj_msgSend(self, "willChangeValueForKey:", aKey);
            self[ivar] = aValue;
            objj_msgSend(self, "didChangeValueForKey:", aKey);
            return;
        }
    }
    objj_msgSend(self, "setValue:forUndefinedKey:", aValue, aKey);
}
}), new objj_method(sel_getUid("setValue:forUndefinedKey:"), function(self, _cmd, aValue, aKey)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPException, "exceptionWithName:reason:userInfo:", CPUndefinedKeyException, objj_msgSend(self, "description") + " is not key value coding-compliant for the key " + aKey, objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [self, aKey], [CPTargetObjectUserInfoKey, CPUnknownUserInfoKey])), "raise");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("accessInstanceVariablesDirectly"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("_accessorForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    if (!CPObjectAccessorsForClass)
        CPObjectAccessorsForClass = objj_msgSend(CPDictionary, "dictionary");
    var UID = objj_msgSend(isa, "UID"),
        selector = nil,
        accessors = objj_msgSend(CPObjectAccessorsForClass, "objectForKey:", UID);
    if (accessors)
    {
        selector = objj_msgSend(accessors, "objectForKey:", aKey);
        if (selector)
            return selector === objj_msgSend(CPNull, "null") ? nil : selector;
    }
    else
    {
        accessors = objj_msgSend(CPDictionary, "dictionary");
        objj_msgSend(CPObjectAccessorsForClass, "setObject:forKey:", accessors, UID);
    }
    var capitalizedKey = aKey.charAt(0).toUpperCase() + aKey.substr(1);
    if (objj_msgSend(self, "instancesRespondToSelector:", selector = CPSelectorFromString("get" + capitalizedKey)) ||
        objj_msgSend(self, "instancesRespondToSelector:", selector = CPSelectorFromString(aKey)) ||
        objj_msgSend(self, "instancesRespondToSelector:", selector = CPSelectorFromString("is" + capitalizedKey)) ||
        objj_msgSend(self, "instancesRespondToSelector:", selector = CPSelectorFromString("_get" + capitalizedKey)) ||
        objj_msgSend(self, "instancesRespondToSelector:", selector = CPSelectorFromString("_" + aKey)) ||
        objj_msgSend(self, "instancesRespondToSelector:", selector = CPSelectorFromString("_is" + capitalizedKey)))
    {
        objj_msgSend(accessors, "setObject:forKey:", selector, aKey);
        return selector;
    }
    objj_msgSend(accessors, "setObject:forKey:", objj_msgSend(CPNull, "null"), aKey);
    return nil;
}
}), new objj_method(sel_getUid("_modifierForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    if (!CPObjectModifiersForClass)
        CPObjectModifiersForClass = objj_msgSend(CPDictionary, "dictionary");
    var UID = objj_msgSend(isa, "UID"),
        selector = nil,
        modifiers = objj_msgSend(CPObjectModifiersForClass, "objectForKey:", UID);
    if (modifiers)
    {
        selector = objj_msgSend(modifiers, "objectForKey:", aKey);
        if (selector)
            return selector === objj_msgSend(CPNull, "null") ? nil : selector;
    }
    else
    {
        modifiers = objj_msgSend(CPDictionary, "dictionary");
        objj_msgSend(CPObjectModifiersForClass, "setObject:forKey:", modifiers, UID);
    }
    if (selector)
        return selector === objj_msgSend(CPNull, "null") ? nil : selector;
    var capitalizedKey = aKey.charAt(0).toUpperCase() + aKey.substr(1) + ':';
    if (objj_msgSend(self, "instancesRespondToSelector:", selector = CPSelectorFromString("set" + capitalizedKey)) ||
        objj_msgSend(self, "instancesRespondToSelector:", selector = CPSelectorFromString("_set" + capitalizedKey)))
    {
        objj_msgSend(modifiers, "setObject:forKey:", selector, aKey);
        return selector;
    }
    objj_msgSend(modifiers, "setObject:forKey:", objj_msgSend(CPNull, "null"), aKey);
    return nil;
}
})]);
}
{
var the_class = objj_getClass("CPDictionary")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("valueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
 return objj_msgSend(self, "objectForKey:", aKey);
}
}), new objj_method(sel_getUid("setValue:forKey:"), function(self, _cmd, aValue, aKey)
{ with(self)
{
    objj_msgSend(self, "setObject:forKey:", aValue, aKey);
}
})]);
}
objj_executeFile("CPArray+KVO.j", true);

p;21;CPKeyValueObserving.jt;22743;@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;8;CPNull.ji;10;CPObject.ji;7;CPSet.ji;13;CPArray+KVO.jt;22617;objj_executeFile("CPArray.j", true);
objj_executeFile("CPDictionary.j", true);
objj_executeFile("CPException.j", true);
objj_executeFile("CPNull.j", true);
objj_executeFile("CPObject.j", true);
objj_executeFile("CPSet.j", true);
{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("willChangeValueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
}
}), new objj_method(sel_getUid("didChangeValueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
}
}), new objj_method(sel_getUid("willChange:valuesAtIndexes:forKey:"), function(self, _cmd, change, indexes, key)
{ with(self)
{
}
}), new objj_method(sel_getUid("didChange:valuesAtIndexes:forKey:"), function(self, _cmd, change, indexes, key)
{ with(self)
{
}
}), new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"), function(self, _cmd, anObserver, aPath, options, aContext)
{ with(self)
{
    if (!anObserver || !aPath)
        return;
    objj_msgSend(objj_msgSend(_CPKVOProxy, "proxyForObject:", self), "_addObserver:forKeyPath:options:context:", anObserver, aPath, options, aContext);
}
}), new objj_method(sel_getUid("removeObserver:forKeyPath:"), function(self, _cmd, anObserver, aPath)
{ with(self)
{
    if (!anObserver || !aPath)
        return;
    objj_msgSend(self[KVOProxyKey], "_removeObserver:forKeyPath:", anObserver, aPath);
}
}), new objj_method(sel_getUid("applyChange:toKeyPath:"), function(self, _cmd, aChange, aKeyPath)
{ with(self)
{
    var changeKind = objj_msgSend(aChange, "objectForKey:", CPKeyValueChangeKindKey);
    if (changeKind === CPKeyValueChangeSetting)
    {
        var value = objj_msgSend(aChange, "objectForKey:", CPKeyValueChangeNewKey);
        objj_msgSend(self, "setValue:forKeyPath:", value === objj_msgSend(CPNull, "null") ? nil : value, aKeyPath);
    }
    else if (changeKind === CPKeyValueChangeInsertion)
        objj_msgSend(objj_msgSend(self, "mutableArrayValueForKeyPath:", aKeyPath), "insertObjects:atIndexes:", objj_msgSend(aChange, "objectForKey:", CPKeyValueChangeNewKey), objj_msgSend(aChange, "objectForKey:", CPKeyValueChangeIndexesKey));
    else if (changeKind === CPKeyValueChangeRemoval)
        objj_msgSend(objj_msgSend(self, "mutableArrayValueForKeyPath:", aKeyPath), "removeObjectsAtIndexes:", objj_msgSend(aChange, "objectForKey:", CPKeyValueChangeIndexesKey));
    else if (changeKind === CPKeyValueChangeReplacement)
        objj_msgSend(objj_msgSend(self, "mutableArrayValueForKeyPath:", aKeyPath), "replaceObjectAtIndexes:withObjects:", objj_msgSend(aChange, "objectForKey:", CPKeyValueChangeIndexesKey), objj_msgSend(aChange, "objectForKey:", CPKeyValueChangeNewKey));
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("automaticallyNotifiesObserversForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("keyPathsForValuesAffectingValueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    var capitalizedKey = aKey.charAt(0).toUpperCase() + aKey.substring(1);
        selector = "keyPathsForValuesAffecting" + capitalizedKey;
    if (objj_msgSend(objj_msgSend(self, "class"), "respondsToSelector:", selector))
        return objj_msgSend(objj_msgSend(self, "class"), selector);
    return objj_msgSend(CPSet, "set");
}
})]);
}
{
var the_class = objj_getClass("CPDictionary")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("inverseChangeDictionary"), function(self, _cmd)
{ with(self)
{
    var inverseChangeDictionary = objj_msgSend(self, "mutableCopy"),
        changeKind = objj_msgSend(self, "objectForKey:", CPKeyValueChangeKindKey);
    if (changeKind === CPKeyValueChangeSetting || changeKind === CPKeyValueChangeReplacement)
    {
        objj_msgSend(inverseChangeDictionary, "setObject:forKey:", objj_msgSend(self, "objectForKey:", CPKeyValueChangeOldKey), CPKeyValueChangeNewKey);
        objj_msgSend(inverseChangeDictionary, "setObject:forKey:", objj_msgSend(self, "objectForKey:", CPKeyValueChangeNewKey), CPKeyValueChangeOldKey);
    }
    else if (changeKind === CPKeyValueChangeInsertion)
    {
        objj_msgSend(inverseChangeDictionary, "setObject:forKey:", CPKeyValueChangeRemoval, CPKeyValueChangeKindKey);
        objj_msgSend(inverseChangeDictionary, "setObject:forKey:", objj_msgSend(self, "objectForKey:", CPKeyValueChangeNewKey), CPKeyValueChangeOldKey);
        objj_msgSend(inverseChangeDictionary, "removeObjectForKey:", CPKeyValueChangeNewKey);
    }
    else if (changeKind === CPKeyValueChangeRemoval)
    {
        objj_msgSend(inverseChangeDictionary, "setObject:forKey:", CPKeyValueChangeInsertion, CPKeyValueChangeKindKey);
        objj_msgSend(inverseChangeDictionary, "setObject:forKey:", objj_msgSend(self, "objectForKey:", CPKeyValueChangeOldKey), CPKeyValueChangeNewKey);
        objj_msgSend(inverseChangeDictionary, "removeObjectForKey:", CPKeyValueChangeOldKey);
    }
    return inverseChangeDictionary;
}
})]);
}
CPKeyValueObservingOptionNew = 1 << 0;
CPKeyValueObservingOptionOld = 1 << 1;
CPKeyValueObservingOptionInitial = 1 << 2;
CPKeyValueObservingOptionPrior = 1 << 3;
CPKeyValueChangeKindKey = "CPKeyValueChangeKindKey";
CPKeyValueChangeNewKey = "CPKeyValueChangeNewKey";
CPKeyValueChangeOldKey = "CPKeyValueChangeOldKey";
CPKeyValueChangeIndexesKey = "CPKeyValueChangeIndexesKey";
CPKeyValueChangeNotificationIsPriorKey = "CPKeyValueChangeNotificationIsPriorKey";
CPKeyValueChangeSetting = 1;
CPKeyValueChangeInsertion = 2;
CPKeyValueChangeRemoval = 3;
CPKeyValueChangeReplacement = 4;
var kvoNewAndOld = CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld,
    DependentKeysKey = "$KVODEPENDENT",
    KVOProxyKey = "$KVOPROXY";
{var the_class = objj_allocateClassPair(CPObject, "_CPKVOProxy"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_targetObject"), new objj_ivar("_nativeClass"), new objj_ivar("_changesForKey"), new objj_ivar("_observersForKey"), new objj_ivar("_observersForKeyLength"), new objj_ivar("_replacedKeys")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithTarget:"), function(self, _cmd, aTarget)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPKVOProxy").super_class }, "init");
    _targetObject = aTarget;
    _nativeClass = objj_msgSend(aTarget, "class");
    _replacedKeys = objj_msgSend(CPSet, "set");
    _observersForKey = {};
    _changesForKey = {};
    _observersForKeyLength = 0;
    return self;
}
}), new objj_method(sel_getUid("_replaceClass"), function(self, _cmd)
{ with(self)
{
    var currentClass = _nativeClass,
        kvoClassName = "$KVO_"+class_getName(_nativeClass),
        existingKVOClass = objj_lookUpClass(kvoClassName);
    if (existingKVOClass)
    {
        _targetObject.isa = existingKVOClass;
        return;
    }
    var kvoClass = objj_allocateClassPair(currentClass, kvoClassName);
    objj_registerClassPair(kvoClass);
    var methodList = _CPKVOModelSubclass.method_list,
        count = methodList.length;
    for (var i=0; i<count; i++)
    {
        var method = methodList[i];
        class_addMethod(kvoClass, method_getName(method), method_getImplementation(method), "");
    }
    _targetObject.isa = kvoClass;
}
}), new objj_method(sel_getUid("_replaceSetterForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    if (objj_msgSend(_replacedKeys, "containsObject:", aKey) || !objj_msgSend(_nativeClass, "automaticallyNotifiesObserversForKey:", aKey))
        return;
    var currentClass = _nativeClass,
        capitalizedKey = aKey.charAt(0).toUpperCase() + aKey.substring(1),
        found = false,
        replacementMethods = [
            "set"+capitalizedKey+":", _kvoMethodForMethod,
            "_set"+capitalizedKey+":", _kvoMethodForMethod,
            "insertObject:in"+capitalizedKey+"AtIndex:", _kvoInsertMethodForMethod,
            "replaceObjectIn"+capitalizedKey+"AtIndex:withObject:", _kvoReplaceMethodForMethod,
            "removeObjectFrom"+capitalizedKey+"AtIndex:", _kvoRemoveMethodForMethod
        ];
    for (var i=0, count=replacementMethods.length; i<count; i+=2)
    {
        var theSelector = sel_getName(replacementMethods[i]),
            theReplacementMethod = replacementMethods[i+1];
        if (objj_msgSend(_nativeClass, "instancesRespondToSelector:", theSelector))
        {
            var theMethod = class_getInstanceMethod(_nativeClass, theSelector);
            class_addMethod(_targetObject.isa, theSelector, theReplacementMethod(aKey, theMethod), "");
        }
    }
    var affectingKeys = objj_msgSend(objj_msgSend(_nativeClass, "keyPathsForValuesAffectingValueForKey:", aKey), "allObjects"),
        affectingKeysCount = affectingKeys ? affectingKeys.length : 0;
    if (!affectingKeysCount)
        return;
    var dependentKeysForClass = _nativeClass[DependentKeysKey];
    if (!dependentKeysForClass)
    {
        dependentKeysForClass = {};
        _nativeClass[DependentKeysKey] = dependentKeysForClass;
    }
    while (affectingKeysCount--)
    {
        var affectingKey = affectingKeys[affectingKeysCount],
            affectedKeys = dependentKeysForClass[affectingKey];
        if (!affectedKeys)
        {
            affectedKeys = objj_msgSend(CPSet, "new");
            dependentKeysForClass[affectingKey] = affectedKeys;
        }
        objj_msgSend(affectedKeys, "addObject:", aKey);
        objj_msgSend(self, "_replaceSetterForKey:", affectingKey);
    }
}
}), new objj_method(sel_getUid("_addObserver:forKeyPath:options:context:"), function(self, _cmd, anObserver, aPath, options, aContext)
{ with(self)
{
    if (!anObserver)
        return;
    var forwarder = nil;
    if (aPath.indexOf('.') != CPNotFound)
        forwarder = objj_msgSend(objj_msgSend(_CPKVOForwardingObserver, "alloc"), "initWithKeyPath:object:observer:options:context:", aPath, _targetObject, anObserver, options, aContext);
    else
        objj_msgSend(self, "_replaceSetterForKey:", aPath);
    var observers = _observersForKey[aPath];
    if (!observers)
    {
        observers = objj_msgSend(CPDictionary, "dictionary");
        _observersForKey[aPath] = observers;
        _observersForKeyLength++;
    }
    objj_msgSend(observers, "setObject:forKey:", _CPKVOInfoMake(anObserver, options, aContext, forwarder), objj_msgSend(anObserver, "UID"));
    if (options & CPKeyValueObservingOptionInitial)
    {
        var newValue = objj_msgSend(_targetObject, "valueForKeyPath:", aPath);
        if (newValue === nil || newValue === undefined)
            newValue = objj_msgSend(CPNull, "null");
        var changes = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", newValue, CPKeyValueChangeNewKey);
        objj_msgSend(anObserver, "observeValueForKeyPath:ofObject:change:context:", aPath, self, changes, aContext);
    }
}
}), new objj_method(sel_getUid("_removeObserver:forKeyPath:"), function(self, _cmd, anObserver, aPath)
{ with(self)
{
    var observers = _observersForKey[aPath];
    if (aPath.indexOf('.') != CPNotFound)
    {
        var forwarder = objj_msgSend(observers, "objectForKey:", objj_msgSend(anObserver, "UID")).forwarder;
        objj_msgSend(forwarder, "finalize");
    }
    objj_msgSend(observers, "removeObjectForKey:", objj_msgSend(anObserver, "UID"));
    if (!objj_msgSend(observers, "count"))
    {
        _observersForKeyLength--;
        delete _observersForKey[aPath];
    }
    if (!_observersForKeyLength)
    {
        _targetObject.isa = _nativeClass;
        delete _targetObject[KVOProxyKey];
    }
}
}), new objj_method(sel_getUid("_sendNotificationsForKey:changeOptions:isBefore:"), function(self, _cmd, aKey, changeOptions, isBefore)
{ with(self)
{
    var changes = _changesForKey[aKey];
    if (isBefore)
    {
        changes = changeOptions;
        var indexes = objj_msgSend(changes, "objectForKey:", CPKeyValueChangeIndexesKey);
        if (indexes)
        {
            var type = objj_msgSend(changes, "objectForKey:", CPKeyValueChangeKindKey);
            if (type === CPKeyValueChangeReplacement || type === CPKeyValueChangeRemoval)
            {
                var newValues = objj_msgSend(objj_msgSend(_targetObject, "mutableArrayValueForKeyPath:", aKey), "objectsAtIndexes:", indexes);
                objj_msgSend(changes, "setValue:forKey:", newValues, CPKeyValueChangeOldKey);
            }
        }
        else
        {
            var oldValue = objj_msgSend(_targetObject, "valueForKey:", aKey);
            if (oldValue === nil || oldValue === undefined)
                oldValue = objj_msgSend(CPNull, "null");
            objj_msgSend(changes, "setObject:forKey:", oldValue, CPKeyValueChangeOldKey);
        }
        objj_msgSend(changes, "setObject:forKey:", 1, CPKeyValueChangeNotificationIsPriorKey);
        _changesForKey[aKey] = changes;
    }
    else
    {
        objj_msgSend(changes, "removeObjectForKey:", CPKeyValueChangeNotificationIsPriorKey);
        var indexes = objj_msgSend(changes, "objectForKey:", CPKeyValueChangeIndexesKey);
        if (indexes)
        {
            var type = objj_msgSend(changes, "objectForKey:", CPKeyValueChangeKindKey);
            if (type == CPKeyValueChangeReplacement || type == CPKeyValueChangeInsertion)
            {
                var newValues = objj_msgSend(objj_msgSend(_targetObject, "mutableArrayValueForKeyPath:", aKey), "objectsAtIndexes:", indexes);
                objj_msgSend(changes, "setValue:forKey:", newValues, CPKeyValueChangeNewKey);
            }
        }
        else
        {
            var newValue = objj_msgSend(_targetObject, "valueForKey:", aKey);
            if (newValue === nil || newValue === undefined)
                newValue = objj_msgSend(CPNull, "null");
            objj_msgSend(changes, "setObject:forKey:", newValue, CPKeyValueChangeNewKey);
        }
    }
    var observers = objj_msgSend(_observersForKey[aKey], "allValues"),
        count = observers ? observers.length : 0;
    while (count--)
    {
        var observerInfo = observers[count];
        if (isBefore && (observerInfo.options & CPKeyValueObservingOptionPrior))
            objj_msgSend(observerInfo.observer, "observeValueForKeyPath:ofObject:change:context:", aKey, _targetObject, changes, observerInfo.context);
        else if (!isBefore)
            objj_msgSend(observerInfo.observer, "observeValueForKeyPath:ofObject:change:context:", aKey, _targetObject, changes, observerInfo.context);
    }
    var dependentKeysMap = _nativeClass[DependentKeysKey];
    if (!dependentKeysMap)
        return;
    var dependentKeyPaths = objj_msgSend(dependentKeysMap[aKey], "allObjects");
    if (!dependentKeyPaths)
        return;
    var index = 0,
        count = objj_msgSend(dependentKeyPaths, "count");
    for (; index < count; ++index)
    {
        var keyPath = dependentKeyPaths[index];
        objj_msgSend(self, "_sendNotificationsForKey:changeOptions:isBefore:", keyPath, isBefore ? objj_msgSend(changeOptions, "copy") : _changesForKey[keyPath], isBefore);
    }
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("proxyForObject:"), function(self, _cmd, anObject)
{ with(self)
{
    var proxy = anObject[KVOProxyKey];
    if (proxy)
        return proxy;
    proxy = objj_msgSend(objj_msgSend(self, "alloc"), "initWithTarget:", anObject);
    objj_msgSend(proxy, "_replaceClass");
    anObject[KVOProxyKey] = proxy;
    return proxy;
}
})]);
}
{var the_class = objj_allocateClassPair(Nil, "_CPKVOModelSubclass"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("willChangeValueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    if (!aKey)
        return;
    var changeOptions = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", CPKeyValueChangeSetting, CPKeyValueChangeKindKey);
    objj_msgSend(objj_msgSend(_CPKVOProxy, "proxyForObject:", self), "_sendNotificationsForKey:changeOptions:isBefore:", aKey, changeOptions, YES);
}
}), new objj_method(sel_getUid("didChangeValueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    if (!aKey)
        return;
    objj_msgSend(objj_msgSend(_CPKVOProxy, "proxyForObject:", self), "_sendNotificationsForKey:changeOptions:isBefore:", aKey, nil, NO);
}
}), new objj_method(sel_getUid("willChange:valuesAtIndexes:forKey:"), function(self, _cmd, change, indexes, aKey)
{ with(self)
{
    if (!aKey)
        return;
    var changeOptions = objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [change, indexes], [CPKeyValueChangeKindKey, CPKeyValueChangeIndexesKey]);
    objj_msgSend(objj_msgSend(_CPKVOProxy, "proxyForObject:", self), "_sendNotificationsForKey:changeOptions:isBefore:", aKey, changeOptions, YES);
}
}), new objj_method(sel_getUid("didChange:valuesAtIndexes:forKey:"), function(self, _cmd, change, indexes, aKey)
{ with(self)
{
    if (!aKey)
        return;
    objj_msgSend(objj_msgSend(_CPKVOProxy, "proxyForObject:", self), "_sendNotificationsForKey:changeOptions:isBefore:", aKey, nil, NO);
}
}), new objj_method(sel_getUid("class"), function(self, _cmd)
{ with(self)
{
    return self[KVOProxyKey]._nativeClass;
}
}), new objj_method(sel_getUid("superclass"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "class"), "superclass");
}
}), new objj_method(sel_getUid("isKindOfClass:"), function(self, _cmd, aClass)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "class"), "isSubclassOfClass:", aClass);
}
}), new objj_method(sel_getUid("isMemberOfClass:"), function(self, _cmd, aClass)
{ with(self)
{
    return objj_msgSend(self, "class") == aClass;
}
}), new objj_method(sel_getUid("className"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "class").name;
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "_CPKVOForwardingObserver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_object"), new objj_ivar("_observer"), new objj_ivar("_context"), new objj_ivar("_firstPart"), new objj_ivar("_secondPart"), new objj_ivar("_value")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithKeyPath:object:observer:options:context:"), function(self, _cmd, aKeyPath, anObject, anObserver, options, aContext)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPKVOForwardingObserver").super_class }, "init");
    _context = aContext;
    _observer = anObserver;
    _object = anObject;
    var dotIndex = aKeyPath.indexOf('.');
    if (dotIndex == CPNotFound)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Created _CPKVOForwardingObserver without compound key path: "+aKeyPath);
    _firstPart = aKeyPath.substring(0, dotIndex);
    _secondPart = aKeyPath.substring(dotIndex+1);
    objj_msgSend(_object, "addObserver:forKeyPath:options:context:", self, _firstPart, kvoNewAndOld, nil);
    _value = objj_msgSend(_object, "valueForKey:", _firstPart);
    if (_value)
        objj_msgSend(_value, "addObserver:forKeyPath:options:context:", self, _secondPart, kvoNewAndOld, nil);
    return self;
}
}), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function(self, _cmd, aKeyPath, anObject, changes, aContext)
{ with(self)
{
    if (aKeyPath === _firstPart)
    {
        objj_msgSend(_observer, "observeValueForKeyPath:ofObject:change:context:", _firstPart, _object, changes, _context);
        if (_value)
            objj_msgSend(_value, "removeObserver:forKeyPath:", self, _secondPart);
        _value = objj_msgSend(_object, "valueForKey:", _firstPart);
        if (_value)
            objj_msgSend(_value, "addObserver:forKeyPath:options:context:", self, _secondPart, kvoNewAndOld, nil);
    }
    else
    {
        objj_msgSend(_observer, "observeValueForKeyPath:ofObject:change:context:", _firstPart+"."+aKeyPath, _object, changes, _context);
    }
}
}), new objj_method(sel_getUid("finalize"), function(self, _cmd)
{ with(self)
{
    if (_value)
        objj_msgSend(_value, "removeObserver:forKeyPath:", self, _secondPart);
    objj_msgSend(_object, "removeObserver:forKeyPath:", self, _firstPart);
    _object = nil;
    _observer = nil;
    _context = nil;
    _value = nil;
}
})]);
}
var _CPKVOInfoMake = _CPKVOInfoMake= function(anObserver, theOptions, aContext, aForwarder)
{
    return {
        observer: anObserver,
        options: theOptions,
        context: aContext,
        forwarder: aForwarder
    };
}
var _kvoMethodForMethod = _kvoMethodForMethod= function(theKey, theMethod)
{
    return function(self, _cmd, object)
    {
        objj_msgSend(self, "willChangeValueForKey:", theKey);
        theMethod.method_imp(self, _cmd, object);
        objj_msgSend(self, "didChangeValueForKey:", theKey);
    }
}
var _kvoInsertMethodForMethod = _kvoInsertMethodForMethod= function(theKey, theMethod)
{
    return function(self, _cmd, object, index)
    {
        objj_msgSend(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeInsertion, objj_msgSend(CPIndexSet, "indexSetWithIndex:", index), theKey);
        theMethod.method_imp(self, _cmd, object, index);
        objj_msgSend(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeInsertion, objj_msgSend(CPIndexSet, "indexSetWithIndex:", index), theKey)
    }
}
var _kvoReplaceMethodForMethod = _kvoReplaceMethodForMethod= function(theKey, theMethod)
{
    return function(self, _cmd, index, object)
    {
        objj_msgSend(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeReplacement, objj_msgSend(CPIndexSet, "indexSetWithIndex:", index), theKey);
        theMethod.method_imp(self, _cmd, index, object);
        objj_msgSend(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeReplacement, objj_msgSend(CPIndexSet, "indexSetWithIndex:", index), theKey)
    }
}
var _kvoRemoveMethodForMethod = _kvoRemoveMethodForMethod= function(theKey, theMethod)
{
    return function(self, _cmd, index)
    {
        objj_msgSend(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeRemoval, objj_msgSend(CPIndexSet, "indexSetWithIndex:", index), theKey);
        theMethod.method_imp(self, _cmd, index);
        objj_msgSend(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeRemoval, objj_msgSend(CPIndexSet, "indexSetWithIndex:", index), theKey)
    }
}
objj_executeFile("CPArray+KVO.j", true);

p;7;CPLog.jt;17;@STATIC;1.0;t;1;
p;16;CPNotification.jt;1866;@STATIC;1.0;i;10;CPObject.ji;13;CPException.jt;1814;objj_executeFile("CPObject.j", true);
objj_executeFile("CPException.j", true);
{var the_class = objj_allocateClassPair(CPObject, "CPNotification"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_object"), new objj_ivar("_userInfo")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "CPNotification's init method should not be used");
}
}), new objj_method(sel_getUid("initWithName:object:userInfo:"), function(self, _cmd, aNotificationName, anObject, aUserInfo)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPNotification").super_class }, "init");
    if (self)
    {
        _name = aNotificationName;
        _object = anObject;
        _userInfo = aUserInfo;
    }
    return self;
}
}), new objj_method(sel_getUid("name"), function(self, _cmd)
{ with(self)
{
    return _name;
}
}), new objj_method(sel_getUid("object"), function(self, _cmd)
{ with(self)
{
    return _object;
}
}), new objj_method(sel_getUid("userInfo"), function(self, _cmd)
{ with(self)
{
    return _userInfo;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("notificationWithName:object:userInfo:"), function(self, _cmd, aNotificationName, anObject, aUserInfo)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithName:object:userInfo:", aNotificationName, anObject, aUserInfo);
}
}), new objj_method(sel_getUid("notificationWithName:object:"), function(self, _cmd, aNotificationName, anObject)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithName:object:userInfo:", aNotificationName, anObject, nil);
}
})]);
}

p;22;CPNotificationCenter.jt;9301;@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;16;CPNotification.ji;8;CPNull.jt;9199;objj_executeFile("CPArray.j", true);
objj_executeFile("CPDictionary.j", true);
objj_executeFile("CPException.j", true);
objj_executeFile("CPNotification.j", true);
objj_executeFile("CPNull.j", true);
var CPNotificationDefaultCenter = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPNotificationCenter"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_namedRegistries"), new objj_ivar("_unnamedRegistry")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPNotificationCenter").super_class }, "init");
    if (self)
    {
        _namedRegistries = objj_msgSend(CPDictionary, "dictionary");
        _unnamedRegistry = objj_msgSend(objj_msgSend(_CPNotificationRegistry, "alloc"), "init");
    }
   return self;
}
}), new objj_method(sel_getUid("addObserver:selector:name:object:"), function(self, _cmd, anObserver, aSelector, aNotificationName, anObject)
{ with(self)
{
    var registry,
        observer = objj_msgSend(objj_msgSend(_CPNotificationObserver, "alloc"), "initWithObserver:selector:", anObserver, aSelector);
    if (aNotificationName == nil)
        registry = _unnamedRegistry;
    else if (!(registry = objj_msgSend(_namedRegistries, "objectForKey:", aNotificationName)))
    {
        registry = objj_msgSend(objj_msgSend(_CPNotificationRegistry, "alloc"), "init");
        objj_msgSend(_namedRegistries, "setObject:forKey:", registry, aNotificationName);
    }
    objj_msgSend(registry, "addObserver:object:", observer, anObject);
}
}), new objj_method(sel_getUid("removeObserver:"), function(self, _cmd, anObserver)
{ with(self)
{
    var name = nil,
        names = objj_msgSend(_namedRegistries, "keyEnumerator");
    while (name = objj_msgSend(names, "nextObject"))
        objj_msgSend(objj_msgSend(_namedRegistries, "objectForKey:", name), "removeObserver:object:", anObserver, nil);
    objj_msgSend(_unnamedRegistry, "removeObserver:object:", anObserver, nil);
}
}), new objj_method(sel_getUid("removeObserver:name:object:"), function(self, _cmd, anObserver, aNotificationName, anObject)
{ with(self)
{
    if (aNotificationName == nil)
    {
        var name = nil,
            names = objj_msgSend(_namedRegistries, "keyEnumerator");
        while (name = objj_msgSend(names, "nextObject"))
            objj_msgSend(objj_msgSend(_namedRegistries, "objectForKey:", name), "removeObserver:object:", anObserver, anObject);
        objj_msgSend(_unnamedRegistry, "removeObserver:object:", anObserver, anObject);
    }
    else
        objj_msgSend(objj_msgSend(_namedRegistries, "objectForKey:", aNotificationName), "removeObserver:object:", anObserver, anObject);
}
}), new objj_method(sel_getUid("postNotification:"), function(self, _cmd, aNotification)
{ with(self)
{
    if (!aNotification)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "postNotification: does not except 'nil' notifications");
    _CPNotificationCenterPostNotification(self, aNotification);
}
}), new objj_method(sel_getUid("postNotificationName:object:userInfo:"), function(self, _cmd, aNotificationName, anObject, aUserInfo)
{ with(self)
{
   _CPNotificationCenterPostNotification(self, objj_msgSend(objj_msgSend(CPNotification, "alloc"), "initWithName:object:userInfo:", aNotificationName, anObject, aUserInfo));
}
}), new objj_method(sel_getUid("postNotificationName:object:"), function(self, _cmd, aNotificationName, anObject)
{ with(self)
{
   _CPNotificationCenterPostNotification(self, objj_msgSend(objj_msgSend(CPNotification, "alloc"), "initWithName:object:userInfo:", aNotificationName, anObject, nil));
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultCenter"), function(self, _cmd)
{ with(self)
{
    if (!CPNotificationDefaultCenter)
        CPNotificationDefaultCenter = objj_msgSend(objj_msgSend(CPNotificationCenter, "alloc"), "init");
    return CPNotificationDefaultCenter;
}
})]);
}
var _CPNotificationCenterPostNotification = function( self, aNotification)
{
    objj_msgSend(self._unnamedRegistry, "postNotification:", aNotification);
    objj_msgSend(objj_msgSend(self._namedRegistries, "objectForKey:", objj_msgSend(aNotification, "name")), "postNotification:", aNotification);
}
{var the_class = objj_allocateClassPair(CPObject, "_CPNotificationRegistry"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_objectObservers"), new objj_ivar("_observerRemovalCount")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPNotificationRegistry").super_class }, "init");
    if (self)
    {
        _observerRemovalCount = 0;
        _objectObservers = objj_msgSend(CPDictionary, "dictionary");
    }
    return self;
}
}), new objj_method(sel_getUid("addObserver:object:"), function(self, _cmd, anObserver, anObject)
{ with(self)
{
    if (!anObject)
        anObject = objj_msgSend(CPNull, "null");
    var observers = objj_msgSend(_objectObservers, "objectForKey:", objj_msgSend(anObject, "UID"));
    if (!observers)
    {
        observers = [];
        objj_msgSend(_objectObservers, "setObject:forKey:", observers, objj_msgSend(anObject, "UID"));
    }
    observers.push(anObserver);
}
}), new objj_method(sel_getUid("removeObserver:object:"), function(self, _cmd, anObserver, anObject)
{ with(self)
{
    var removedKeys = [];
    if (anObject == nil)
    {
        var key = nil,
            keys = objj_msgSend(_objectObservers, "keyEnumerator");
        while (key = objj_msgSend(keys, "nextObject"))
        {
            var observers = objj_msgSend(_objectObservers, "objectForKey:", key),
                count = observers ? observers.length : 0;
            while (count--)
                if (objj_msgSend(observers[count], "observer") == anObserver)
                {
                    ++_observerRemovalCount;
                    observers.splice(count, 1);
                }
            if (!observers || observers.length == 0)
                removedKeys.push(key);
        }
    }
    else
    {
        var key = objj_msgSend(anObject, "UID"),
            observers = objj_msgSend(_objectObservers, "objectForKey:", key);
            count = observers ? observers.length : 0;
        while (count--)
            if (objj_msgSend(observers[count], "observer") == anObserver)
            {
                ++_observerRemovalCount;
                observers.splice(count, 1)
            }
        if (!observers || observers.length == 0)
            removedKeys.push(key);
    }
    var count = removedKeys.length;
    while (count--)
        objj_msgSend(_objectObservers, "removeObjectForKey:", removedKeys[count]);
}
}), new objj_method(sel_getUid("postNotification:"), function(self, _cmd, aNotification)
{ with(self)
{
    var observerRemovalCount = _observerRemovalCount,
        object = objj_msgSend(aNotification, "object"),
        observers = nil;
    if (object != nil && (observers = objj_msgSend(objj_msgSend(_objectObservers, "objectForKey:", objj_msgSend(object, "UID")), "copy")))
    {
        var currentObservers = observers,
            count = observers.length;
        while (count--)
        {
            var observer = observers[count];
            if ((observerRemovalCount === _observerRemovalCount) || objj_msgSend(currentObservers, "indexOfObjectIdenticalTo:", observer) !== CPNotFound)
                objj_msgSend(observer, "postNotification:", aNotification);
        }
    }
    observers = objj_msgSend(objj_msgSend(_objectObservers, "objectForKey:", objj_msgSend(objj_msgSend(CPNull, "null"), "UID")), "copy");
    if (!observers)
        return;
    var observerRemovalCount = _observerRemovalCount,
        count = observers.length,
        currentObservers = observers;
    while (count--)
    {
        var observer = observers[count];
        if ((observerRemovalCount === _observerRemovalCount) || objj_msgSend(currentObservers, "indexOfObjectIdenticalTo:", observer) !== CPNotFound)
            objj_msgSend(observer, "postNotification:", aNotification);
    }
}
}), new objj_method(sel_getUid("count"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_objectObservers, "count");
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "_CPNotificationObserver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_observer"), new objj_ivar("_selector")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithObserver:selector:"), function(self, _cmd, anObserver, aSelector)
{ with(self)
{
    if (self)
    {
        _observer = anObserver;
        _selector = aSelector;
    }
   return self;
}
}), new objj_method(sel_getUid("observer"), function(self, _cmd)
{ with(self)
{
    return _observer;
}
}), new objj_method(sel_getUid("postNotification:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(_observer, "performSelector:withObject:", _selector, aNotification);
}
})]);
}

p;8;CPNull.jt;824;@STATIC;1.0;i;10;CPObject.jt;791;objj_executeFile("CPObject.j", true);
var CPNullSharedNull = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPNull"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("null"), function(self, _cmd)
{ with(self)
{
    if (!CPNullSharedNull)
        CPNullSharedNull = objj_msgSend(objj_msgSend(CPNull, "alloc"), "init");
    return CPNullSharedNull;
}
})]);
}
{
var the_class = objj_getClass("CPNull")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPNull\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("countByEnumeratingWithState:objects:count:"), function(self, _cmd, aState, objects, aCount)
{ with(self)
{
    return 0;
}
})]);
}

p;10;CPNumber.jt;7268;@STATIC;1.0;i;10;CPObject.ji;15;CPObjJRuntime.jt;7214;objj_executeFile("CPObject.j", true);
objj_executeFile("CPObjJRuntime.j", true);
var __placeholder = new Number(),
    _CPNumberHashes = { };
{var the_class = objj_allocateClassPair(CPObject, "CPNumber"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithBool:"), function(self, _cmd, aBoolean)
{ with(self)
{
    return aBoolean;
}
}), new objj_method(sel_getUid("initWithChar:"), function(self, _cmd, aChar)
{ with(self)
{
    if (aChar.charCodeAt)
        return aChar.charCodeAt(0);
    return aChar;
}
}), new objj_method(sel_getUid("initWithDouble:"), function(self, _cmd, aDouble)
{ with(self)
{
    return aDouble;
}
}), new objj_method(sel_getUid("initWithFloat:"), function(self, _cmd, aFloat)
{ with(self)
{
    return aFloat;
}
}), new objj_method(sel_getUid("initWithInt:"), function(self, _cmd, anInt)
{ with(self)
{
    return anInt;
}
}), new objj_method(sel_getUid("initWithLong:"), function(self, _cmd, aLong)
{ with(self)
{
    return aLong;
}
}), new objj_method(sel_getUid("initWithLongLong:"), function(self, _cmd, aLongLong)
{ with(self)
{
    return aLongLong;
}
}), new objj_method(sel_getUid("initWithShort:"), function(self, _cmd, aShort)
{ with(self)
{
    return aShort;
}
}), new objj_method(sel_getUid("initWithUnsignedChar:"), function(self, _cmd, aChar)
{ with(self)
{
    if (aChar.charCodeAt)
        return aChar.charCodeAt(0);
    return aChar;
}
}), new objj_method(sel_getUid("initWithUnsignedInt:"), function(self, _cmd, anUnsignedInt)
{ with(self)
{
    return anUnsignedInt;
}
}), new objj_method(sel_getUid("initWithUnsignedLong:"), function(self, _cmd, anUnsignedLong)
{ with(self)
{
    return anUnsignedLong;
}
}), new objj_method(sel_getUid("initWithUnsignedShort:"), function(self, _cmd, anUnsignedShort)
{ with(self)
{
    return anUnsignedShort;
}
}), new objj_method(sel_getUid("UID"), function(self, _cmd)
{ with(self)
{
    if (!_CPNumberHashes[self])
        _CPNumberHashes[self] = _objj_generateObjectHash();
    return _CPNumberHashes[self];
}
}), new objj_method(sel_getUid("boolValue"), function(self, _cmd)
{ with(self)
{
    return self ? true : false;
}
}), new objj_method(sel_getUid("charValue"), function(self, _cmd)
{ with(self)
{
    return String.fromCharCode(self);
}
}), new objj_method(sel_getUid("decimalValue"), function(self, _cmd)
{ with(self)
{
    objj_throw_exception("decimalValue: NOT YET IMPLEMENTED");
}
}), new objj_method(sel_getUid("descriptionWithLocale:"), function(self, _cmd, aDictionary)
{ with(self)
{
    if (!aDictionary) return toString();
    objj_throw_exception("descriptionWithLocale: NOT YET IMPLEMENTED");
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "descriptionWithLocale:", nil);
}
}), new objj_method(sel_getUid("doubleValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("floatValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("intValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("longLongValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("longValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("shortValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("stringValue"), function(self, _cmd)
{ with(self)
{
    return toString();
}
}), new objj_method(sel_getUid("unsignedCharValue"), function(self, _cmd)
{ with(self)
{
    return String.fromCharCode(self);
}
}), new objj_method(sel_getUid("unsignedIntValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("unsignedLongValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("unsignedShortValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("compare:"), function(self, _cmd, aNumber)
{ with(self)
{
    if (self > aNumber) return CPOrderedDescending;
    else if (self < aNumber) return CPOrderedAscending;
    return CPOrderedSame;
}
}), new objj_method(sel_getUid("isEqualToNumber:"), function(self, _cmd, aNumber)
{ with(self)
{
    return self == aNumber;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return __placeholder;
}
}), new objj_method(sel_getUid("numberWithBool:"), function(self, _cmd, aBoolean)
{ with(self)
{
    return aBoolean;
}
}), new objj_method(sel_getUid("numberWithChar:"), function(self, _cmd, aChar)
{ with(self)
{
    if (aChar.charCodeAt)
        return aChar.charCodeAt(0);
    return aChar;
}
}), new objj_method(sel_getUid("numberWithDouble:"), function(self, _cmd, aDouble)
{ with(self)
{
    return aDouble;
}
}), new objj_method(sel_getUid("numberWithFloat:"), function(self, _cmd, aFloat)
{ with(self)
{
    return aFloat;
}
}), new objj_method(sel_getUid("numberWithInt:"), function(self, _cmd, anInt)
{ with(self)
{
    return anInt;
}
}), new objj_method(sel_getUid("numberWithLong:"), function(self, _cmd, aLong)
{ with(self)
{
    return aLong;
}
}), new objj_method(sel_getUid("numberWithLongLong:"), function(self, _cmd, aLongLong)
{ with(self)
{
    return aLongLong;
}
}), new objj_method(sel_getUid("numberWithShort:"), function(self, _cmd, aShort)
{ with(self)
{
    return aShort;
}
}), new objj_method(sel_getUid("numberWithUnsignedChar:"), function(self, _cmd, aChar)
{ with(self)
{
    if (aChar.charCodeAt)
        return aChar.charCodeAt(0);
    return aChar;
}
}), new objj_method(sel_getUid("numberWithUnsignedInt:"), function(self, _cmd, anUnsignedInt)
{ with(self)
{
    return anUnsignedInt;
}
}), new objj_method(sel_getUid("numberWithUnsignedLong:"), function(self, _cmd, anUnsignedLong)
{ with(self)
{
    return anUnsignedLong;
}
}), new objj_method(sel_getUid("numberWithUnsignedShort:"), function(self, _cmd, anUnsignedShort)
{ with(self)
{
    return anUnsignedShort;
}
})]);
}
{
var the_class = objj_getClass("CPNumber")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPNumber\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(aCoder, "decodeNumber");
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeNumber:forKey:", self, "self");
}
})]);
}
Number.prototype.isa = CPNumber;
Boolean.prototype.isa = CPNumber;
objj_msgSend(CPNumber, "initialize");

p;10;CPObject.jt;8015;@STATIC;1.0;t;7996;{var the_class = objj_allocateClassPair(Nil, "CPObject"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("isa")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("mutableCopy"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "copy");
}
}), new objj_method(sel_getUid("dealloc"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("class"), function(self, _cmd)
{ with(self)
{
    return isa;
}
}), new objj_method(sel_getUid("isKindOfClass:"), function(self, _cmd, aClass)
{ with(self)
{
    return objj_msgSend(isa, "isSubclassOfClass:", aClass);
}
}), new objj_method(sel_getUid("isMemberOfClass:"), function(self, _cmd, aClass)
{ with(self)
{
    return self.isa === aClass;
}
}), new objj_method(sel_getUid("isProxy"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("respondsToSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    return !!class_getInstanceMethod(isa, aSelector);
}
}), new objj_method(sel_getUid("methodForSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    return class_getMethodImplementation(isa, aSelector);
}
}), new objj_method(sel_getUid("methodSignatureForSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    return nil;
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return "<" + class_getName(isa) + " 0x" + objj_msgSend(CPString, "stringWithHash:", objj_msgSend(self, "UID")) + ">";
}
}), new objj_method(sel_getUid("performSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    return objj_msgSend(self, aSelector);
}
}), new objj_method(sel_getUid("performSelector:withObject:"), function(self, _cmd, aSelector, anObject)
{ with(self)
{
    return objj_msgSend(self, aSelector, anObject);
}
}), new objj_method(sel_getUid("performSelector:withObject:withObject:"), function(self, _cmd, aSelector, anObject, anotherObject)
{ with(self)
{
    return objj_msgSend(self, aSelector, anObject, anotherObject);
}
}), new objj_method(sel_getUid("forwardInvocation:"), function(self, _cmd, anInvocation)
{ with(self)
{
    objj_msgSend(self, "doesNotRecognizeSelector:", objj_msgSend(anInvocation, "selector"));
}
}), new objj_method(sel_getUid("forward::"), function(self, _cmd, aSelector, args)
{ with(self)
{
    var signature = objj_msgSend(self, "methodSignatureForSelector:", aSelector);
    if (signature)
    {
        invocation = objj_msgSend(CPInvocation, "invocationWithMethodSignature:", signature);
        objj_msgSend(invocation, "setTarget:", self);
        objj_msgSend(invocation, "setSelector:", aSelector);
        var index = 2,
            count = args.length;
        for (; index < count; ++index)
            objj_msgSend(invocation, "setArgument:atIndex:", args[index], index);
        objj_msgSend(self, "forwardInvocation:", invocation);
        return objj_msgSend(invocation, "returnValue");
    }
    objj_msgSend(self, "doesNotRecognizeSelector:", aSelector);
}
}), new objj_method(sel_getUid("doesNotRecognizeSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, 
        (class_isMetaClass(isa) ? "+" : "-") + " [" + objj_msgSend(self, "className") + " " + aSelector + "] unrecognized selector sent to " +
        (class_isMetaClass(isa) ? "class" : "instance") + " 0x" + objj_msgSend(CPString, "stringWithHash:", objj_msgSend(self, "UID")));
}
}), new objj_method(sel_getUid("awakeAfterUsingCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("classForKeyedArchiver"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "classForCoder");
}
}), new objj_method(sel_getUid("classForCoder"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "class");
}
}), new objj_method(sel_getUid("replacementObjectForArchiver:"), function(self, _cmd, anArchiver)
{ with(self)
{
    return objj_msgSend(self, "replacementObjectForCoder:", anArchiver);
}
}), new objj_method(sel_getUid("replacementObjectForKeyedArchiver:"), function(self, _cmd, anArchiver)
{ with(self)
{
    return objj_msgSend(self, "replacementObjectForCoder:", anArchiver);
}
}), new objj_method(sel_getUid("replacementObjectForCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("className"), function(self, _cmd)
{ with(self)
{
    return isa.name;
}
}), new objj_method(sel_getUid("autorelease"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("hash"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "UID");
}
}), new objj_method(sel_getUid("UID"), function(self, _cmd)
{ with(self)
{
    if (typeof self.__address === "undefined")
        self.__address = _objj_generateObjectHash();
    return __address + "";
}
}), new objj_method(sel_getUid("isEqual:"), function(self, _cmd, anObject)
{ with(self)
{
    return self === anObject || objj_msgSend(self, "UID") === objj_msgSend(anObject, "UID");
}
}), new objj_method(sel_getUid("retain"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("release"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("self"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("superclass"), function(self, _cmd)
{ with(self)
{
    return isa.super_class;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("load"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("new"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
}), new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return class_createInstance(self);
}
}), new objj_method(sel_getUid("allocWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "alloc");
}
}), new objj_method(sel_getUid("class"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("superclass"), function(self, _cmd)
{ with(self)
{
    return super_class;
}
}), new objj_method(sel_getUid("isSubclassOfClass:"), function(self, _cmd, aClass)
{ with(self)
{
    var theClass = self;
    for(; theClass; theClass = theClass.super_class)
        if(theClass === aClass)
            return YES;
    return NO;
}
}), new objj_method(sel_getUid("isKindOfClass:"), function(self, _cmd, aClass)
{ with(self)
{
    return objj_msgSend(self, "isSubclassOfClass:", aClass);
}
}), new objj_method(sel_getUid("isMemberOfClass:"), function(self, _cmd, aClass)
{ with(self)
{
    return self === aClass;
}
}), new objj_method(sel_getUid("instancesRespondToSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    return !!class_getInstanceMethod(self, aSelector);
}
}), new objj_method(sel_getUid("instanceMethodForSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    return class_getMethodImplementation(self, aSelector);
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return class_getName(isa);
}
}), new objj_method(sel_getUid("setVersion:"), function(self, _cmd, aVersion)
{ with(self)
{
    version = aVersion;
    return self;
}
}), new objj_method(sel_getUid("version"), function(self, _cmd)
{ with(self)
{
    return version;
}
})]);
}
objj_class.prototype.toString = objj_object.prototype.toString = function()
{
    if (this.isa && class_getInstanceMethod(this.isa, "description") != NULL)
        return objj_msgSend(this, "description")
    else
        return String(this) + " (-description not implemented)";
}

p;15;CPObjJRuntime.jt;530;@STATIC;1.0;i;7;CPLog.jt;501;objj_executeFile("CPLog.j", true);
CPStringFromSelector= function(aSelector)
{
    return sel_getName(aSelector);
}
CPSelectorFromString= function(aSelectorName)
{
    return sel_registerName(aSelectorName);
}
CPClassFromString= function(aClassName)
{
    return objj_getClass(aClassName);
}
CPStringFromClass= function(aClass)
{
    return class_getName(aClass);
}
CPOrderedAscending = -1;
CPOrderedSame = 0;
CPOrderedDescending = 1;
CPNotFound = -1;
MIN = Math.min;
MAX = Math.max;
ABS = Math.abs;

p;13;CPOperation.jt;5252;@STATIC;1.0;I;21;Foundation/CPObject.jt;5207;objj_executeFile("Foundation/CPObject.j", false);
CPOperationQueuePriorityVeryLow = -8;
CPOperationQueuePriorityLow = -4;
CPOperationQueuePriorityNormal = 0;
CPOperationQueuePriorityHigh = 4;
CPOperationQueuePriorityVeryHigh = 8;
{var the_class = objj_allocateClassPair(CPObject, "CPOperation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("operations"), new objj_ivar("_cancelled"), new objj_ivar("_executing"), new objj_ivar("_finished"), new objj_ivar("_ready"), new objj_ivar("_queuePriority"), new objj_ivar("_completionFunction"), new objj_ivar("_dependencies")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("main"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOperation").super_class }, "init"))
    {
        _cancelled = NO;
        _executing = NO;
        _finished = NO;
        _ready = YES;
        _dependencies = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
        _queuePriority = CPOperationQueuePriorityNormal;
    }
    return self;
}
}), new objj_method(sel_getUid("start"), function(self, _cmd)
{ with(self)
{
    if (!_cancelled)
    {
        objj_msgSend(self, "willChangeValueForKey:", "isExecuting");
        _executing = YES;
        objj_msgSend(self, "didChangeValueForKey:", "isExecuting");
        objj_msgSend(self, "main");
        if (_completionFunction)
        {
            _completionFunction();
        }
        objj_msgSend(self, "willChangeValueForKey:", "isExecuting");
        _executing = NO;
        objj_msgSend(self, "didChangeValueForKey:", "isExecuting");
        objj_msgSend(self, "willChangeValueForKey:", "isFinished");
        _finished = YES;
        objj_msgSend(self, "didChangeValueForKey:", "isFinished");
    }
}
}), new objj_method(sel_getUid("isCancelled"), function(self, _cmd)
{ with(self)
{
    return _cancelled;
}
}), new objj_method(sel_getUid("isExecuting"), function(self, _cmd)
{ with(self)
{
    return _executing;
}
}), new objj_method(sel_getUid("isFinished"), function(self, _cmd)
{ with(self)
{
    return _finished;
}
}), new objj_method(sel_getUid("isConcurrent"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("isReady"), function(self, _cmd)
{ with(self)
{
    return _ready;
}
}), new objj_method(sel_getUid("completionFunction"), function(self, _cmd)
{ with(self)
{
    return _completionFunction;
}
}), new objj_method(sel_getUid("setCompletionFunction:"), function(self, _cmd, aJavaScriptFunction)
{ with(self)
{
    _completionFunction = aJavaScriptFunction;
}
}), new objj_method(sel_getUid("addDependency:"), function(self, _cmd, anOperation)
{ with(self)
{
    objj_msgSend(self, "willChangeValueForKey:", "dependencies");
    objj_msgSend(anOperation, "addObserver:forKeyPath:options:context:", self, "isFinished", (CPKeyValueObservingOptionNew), NULL);
    objj_msgSend(_dependencies, "addObject:", anOperation);
    objj_msgSend(self, "didChangeValueForKey:", "dependencies");
    objj_msgSend(self, "_updateIsReadyState");
}
}), new objj_method(sel_getUid("removeDependency:"), function(self, _cmd, anOperation)
{ with(self)
{
    objj_msgSend(self, "willChangeValueForKey:", "dependencies");
    objj_msgSend(_dependencies, "removeObject:", anOperation);
    objj_msgSend(anOperation, "removeObserver:forKeyPath:", self, "isFinished");
    objj_msgSend(self, "didChangeValueForKey:", "dependencies");
    objj_msgSend(self, "_updateIsReadyState");
}
}), new objj_method(sel_getUid("dependencies"), function(self, _cmd)
{ with(self)
{
    return _dependencies;
}
}), new objj_method(sel_getUid("waitUntilFinished"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("cancel"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "willChangeValueForKey:", "isCancelled");
    _cancelled = YES;
    objj_msgSend(self, "didChangeValueForKey:", "isCancelled");
}
}), new objj_method(sel_getUid("setQueuePriority:"), function(self, _cmd, priority)
{ with(self)
{
    _queuePriority = priority;
}
}), new objj_method(sel_getUid("queuePriority"), function(self, _cmd)
{ with(self)
{
    return _queuePriority;
}
}), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function(self, _cmd, keyPath, object, change, context)
{ with(self)
{
    if (keyPath == "isFinished")
    {
        objj_msgSend(self, "_updateIsReadyState");
    }
}
}), new objj_method(sel_getUid("_updateIsReadyState"), function(self, _cmd)
{ with(self)
{
    var newReady = YES;
    if (_dependencies && objj_msgSend(_dependencies, "count") > 0)
    {
        var i = 0;
        for (i = 0; i < objj_msgSend(_dependencies, "count"); i++)
        {
            if (!objj_msgSend(objj_msgSend(_dependencies, "objectAtIndex:", i), "isFinished"))
            {
                newReady = NO;
            }
        }
    }
    if (newReady != _ready)
    {
        objj_msgSend(self, "willChangeValueForKey:", "isReady");
        _ready = newReady;
        objj_msgSend(self, "didChangeValueForKey:", "isReady");
    }
}
})]);
}

p;18;CPOperationQueue.jt;6968;@STATIC;1.0;I;21;Foundation/CPObject.ji;13;CPOperation.ji;23;CPInvocationOperation.ji;21;CPFunctionOperation.jt;6851;objj_executeFile("Foundation/CPObject.j", false);
objj_executeFile("CPOperation.j", true);
objj_executeFile("CPInvocationOperation.j", true);
objj_executeFile("CPFunctionOperation.j", true);
var cpOperationMainQueue = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPOperationQueue"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_operations"), new objj_ivar("_suspended"), new objj_ivar("_name"), new objj_ivar("_timer")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("name"), function(self, _cmd)
{ with(self)
{
return _name;
}
}),
new objj_method(sel_getUid("setName:"), function(self, _cmd, newValue)
{ with(self)
{
_name = newValue;
}
}), new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOperationQueue").super_class }, "init"))
    {
        _operations = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
        _suspended = NO;
        _currentlyModifyingOps = NO;
        _timer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.01, self, sel_getUid("_runNextOpsInQueue"), nil, YES);
    }
    return self;
}
}), new objj_method(sel_getUid("_runNextOpsInQueue"), function(self, _cmd)
{ with(self)
{
    if (!_suspended && objj_msgSend(self, "operationCount") > 0)
    {
        var i = 0;
        for (i = 0; i < objj_msgSend(_operations, "count"); i++)
        {
            var op = objj_msgSend(_operations, "objectAtIndex:", i);
            if (objj_msgSend(op, "isReady") && !objj_msgSend(op, "isCancelled") && !objj_msgSend(op, "isFinished") && !objj_msgSend(op, "isExecuting"))
            {
                objj_msgSend(op, "start");
            }
        }
    }
}
}), new objj_method(sel_getUid("_enableTimer:"), function(self, _cmd, enable)
{ with(self)
{
    if (!enable)
    {
        if (_timer)
        {
            objj_msgSend(_timer, "invalidate");
            _timer = nil;
        }
    }
    else
    {
        if (!_timer)
        {
            _timer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.01, self, sel_getUid("_runNextOpsInQueue"), nil, YES);
        }
    }
}
}), new objj_method(sel_getUid("addOperation:"), function(self, _cmd, anOperation)
{ with(self)
{
    objj_msgSend(self, "willChangeValueForKey:", "operations");
    objj_msgSend(self, "willChangeValueForKey:", "operationCount");
    objj_msgSend(_operations, "addObject:", anOperation);
    objj_msgSend(self, "_sortOpsByPriority:", _operations);
    objj_msgSend(self, "didChangeValueForKey:", "operations");
    objj_msgSend(self, "didChangeValueForKey:", "operationCount");
}
}), new objj_method(sel_getUid("addOperations:waitUntilFinished:"), function(self, _cmd, ops, wait)
{ with(self)
{
    if (ops)
    {
        if (wait)
        {
            objj_msgSend(self, "_sortOpsByPriority:", ops);
            objj_msgSend(self, "_runOpsSynchronously:", ops);
        }
        objj_msgSend(_operations, "addObjectsFromArray:", ops);
        objj_msgSend(self, "_sortOpsByPriority:", _operations);
    }
}
}), new objj_method(sel_getUid("addOperationWithFunction:"), function(self, _cmd, aFunction)
{ with(self)
{
    objj_msgSend(self, "addOperation:", objj_msgSend(CPFunctionOperation, "functionOperationWithFunction:", aFunction));
}
}), new objj_method(sel_getUid("operations"), function(self, _cmd)
{ with(self)
{
    return _operations;
}
}), new objj_method(sel_getUid("operationCount"), function(self, _cmd)
{ with(self)
{
    if (_operations)
    {
        return objj_msgSend(_operations, "count");
    }
    return 0;
}
}), new objj_method(sel_getUid("cancelAllOperations"), function(self, _cmd)
{ with(self)
{
    if (_operations)
    {
       var i = 0;
       for (i = 0; i < objj_msgSend(_operations, "count"); i++)
       {
           objj_msgSend(objj_msgSend(_operations, "objectAtIndex:", i), "cancel");
       }
    }
}
}), new objj_method(sel_getUid("waitUntilAllOperationsAreFinished"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_enableTimer:", NO);
    objj_msgSend(self, "_runOpsSynchronously:", _operations);
    if (!_suspended)
    {
        objj_msgSend(self, "_enableTimer:", YES);
    }
}
}), new objj_method(sel_getUid("maxConcurrentOperationCount"), function(self, _cmd)
{ with(self)
{
    return 1;
}
}), new objj_method(sel_getUid("setSuspended:"), function(self, _cmd, suspend)
{ with(self)
{
    _suspended = suspend;
    objj_msgSend(self, "_enableTimer:", !suspend);
}
}), new objj_method(sel_getUid("isSuspended"), function(self, _cmd)
{ with(self)
{
    return _suspended;
}
}), new objj_method(sel_getUid("_sortOpsByPriority:"), function(self, _cmd, someOps)
{ with(self)
{
    if (someOps)
    {
        objj_msgSend(someOps, "sortUsingFunction:context:", function(lhs, rhs)
        {
            if (objj_msgSend(lhs, "queuePriority") < objj_msgSend(rhs, "queuePriority"))
            {
                return 1;
            }
            else
            {
                if (objj_msgSend(lhs, "queuePriority") > objj_msgSend(rhs, "queuePriority"))
                {
                    return -1;
                }
                else
                {
                    return 0;
                }
            }
        }, nil);
    }
}
}), new objj_method(sel_getUid("_runOpsSynchronously:"), function(self, _cmd, ops)
{ with(self)
{
    if (ops)
    {
        var keepGoing = YES;
        while (keepGoing)
        {
            var i = 0;
            keepGoing = NO;
            for (i = 0; i < objj_msgSend(ops, "count"); i++)
            {
                var op = objj_msgSend(ops, "objectAtIndex:", i);
                if (objj_msgSend(op, "isReady") && !objj_msgSend(op, "isCancelled") && !objj_msgSend(op, "isFinished") && !objj_msgSend(op, "isExecuting"))
                {
                    objj_msgSend(op, "start");
                }
            }
            for (i = 0; i < objj_msgSend(ops, "count"); i++)
            {
                var op = objj_msgSend(ops, "objectAtIndex:", i);
                if (!objj_msgSend(op, "isFinished") && !objj_msgSend(op, "isCancelled"))
                {
                    keepGoing = YES;
                }
            }
        }
    }
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("mainQueue"), function(self, _cmd)
{ with(self)
{
    if (!cpOperationMainQueue)
    {
        cpOperationMainQueue = objj_msgSend(objj_msgSend(CPOperationQueue, "alloc"), "init");
        objj_msgSend(cpOperationMainQueue, "setName:", "main");
    }
    return cpOperationMainQueue;
}
}), new objj_method(sel_getUid("currentQueue"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPOperationQueue, "mainQueue");
}
})]);
}

p;29;CPPropertyListSerialization.jt;1769;@STATIC;1.0;i;10;CPObject.jt;1735;objj_executeFile("CPObject.j", true);
CPPropertyListUnknownFormat = 0;
CPPropertyListOpenStepFormat = kCFPropertyListOpenStepFormat;
CPPropertyListXMLFormat_v1_0 = kCFPropertyListXMLFormat_v1_0;
CPPropertyListBinaryFormat_v1_0 = kCFPropertyListBinaryFormat_v1_0;
CPPropertyList280NorthFormat_v1_0 = kCFPropertyList280NorthFormat_v1_0;
{var the_class = objj_allocateClassPair(CPObject, "CPPropertyListSerialization"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("dataFromPropertyList:format:"), function(self, _cmd, aPlist, aFormat)
{ with(self)
{
    return CPPropertyListCreateData(aPlist, aFormat);
}
}), new objj_method(sel_getUid("propertyListFromData:format:"), function(self, _cmd, data, aFormat)
{ with(self)
{
    return CPPropertyListCreateFromData(data, aFormat);
}
})]);
}
{
var the_class = objj_getClass("CPPropertyListSerialization")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPropertyListSerialization\"");
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("dataFromPropertyList:format:errorDescription:"), function(self, _cmd, aPlist, aFormat, anErrorString)
{ with(self)
{
    _CPReportLenientDeprecation(self, _cmd, sel_getUid("dataFromPropertyList:format:"));
    return objj_msgSend(self, "dataFromPropertyList:format:", aPlist, aFormat);
}
}), new objj_method(sel_getUid("propertyListFromData:format:errorDescription:"), function(self, _cmd, data, aFormat, errorString)
{ with(self)
{
    _CPReportLenientDeprecation(self, _cmd, sel_getUid("propertyListFromData:format:"));
    return objj_msgSend(self, "propertyListFromData:format:", data, aFormat);
}
})]);
}

p;9;CPProxy.jt;4313;@STATIC;1.0;i;13;CPException.ji;14;CPInvocation.ji;10;CPString.jt;4242;objj_executeFile("CPException.j", true);
objj_executeFile("CPInvocation.j", true);
objj_executeFile("CPString.j", true);
{var the_class = objj_allocateClassPair(Nil, "CPProxy"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("methodSignatureForSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "-methodSignatureForSelector: called on abstract CPProxy class.");
}
}), new objj_method(sel_getUid("forwardInvocation:"), function(self, _cmd, anInvocation)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "-methodSignatureForSelector: called on abstract CPProxy class.");
}
}), new objj_method(sel_getUid("forward::"), function(self, _cmd, aSelector, args)
{ with(self)
{
    objj_msgSend(CPObject, "methodForSelector:", _cmd)(self, _cmd, aSelector, args);
}
}), new objj_method(sel_getUid("hash"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "UID");
}
}), new objj_method(sel_getUid("UID"), function(self, _cmd)
{ with(self)
{
    if (typeof self.__address === "undefined")
        self.__address = _objj_generateObjectHash();
    return __address;
}
}), new objj_method(sel_getUid("isEqual:"), function(self, _cmd, anObject)
{ with(self)
{
   return self === object;
}
}), new objj_method(sel_getUid("self"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("class"), function(self, _cmd)
{ with(self)
{
    return isa;
}
}), new objj_method(sel_getUid("superclass"), function(self, _cmd)
{ with(self)
{
    return class_getSuperclass(isa);
}
}), new objj_method(sel_getUid("performSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    return objj_msgSend(self, aSelector);
}
}), new objj_method(sel_getUid("performSelector:withObject:"), function(self, _cmd, aSelector, anObject)
{ with(self)
{
    return objj_msgSend(self, aSelector, anObject);
}
}), new objj_method(sel_getUid("performSelector:withObject:withObject:"), function(self, _cmd, aSelector, anObject, anotherObject)
{ with(self)
{
    return objj_msgSend(self, aSelector, anObject, anotherObject);
}
}), new objj_method(sel_getUid("isProxy"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("isKindOfClass:"), function(self, _cmd, aClass)
{ with(self)
{
    var signature = objj_msgSend(self, "methodSignatureForSelector:", _cmd),
        invocation = objj_msgSend(CPInvocation, "invocationWithMethodSignature:", signature);
   objj_msgSend(self, "forwardInvocation:", invocation);
   return objj_msgSend(invocation, "returnValue");
}
}), new objj_method(sel_getUid("isMemberOfClass:"), function(self, _cmd, aClass)
{ with(self)
{
    var signature = objj_msgSend(self, "methodSignatureForSelector:", _cmd),
        invocation = objj_msgSend(CPInvocation, "invocationWithMethodSignature:", signature);
   objj_msgSend(self, "forwardInvocation:", invocation);
   return objj_msgSend(invocation, "returnValue");
}
}), new objj_method(sel_getUid("respondsToSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    var signature = objj_msgSend(self, "methodSignatureForSelector:", _cmd),
        invocation = objj_msgSend(CPInvocation, "invocationWithMethodSignature:", signature);
   objj_msgSend(self, "forwardInvocation:", invocation);
   return objj_msgSend(invocation, "returnValue");
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return "<" + class_getName(isa) + " 0x" + objj_msgSend(CPString, "stringWithHash:", objj_msgSend(self, "UID")) + ">";
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("load"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("class"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return class_createInstance(self);
}
}), new objj_method(sel_getUid("respondsToSelector:"), function(self, _cmd, selector)
{ with(self)
{
    return !!class_getInstanceMethod(isa, aSelector);
}
})]);
}

p;9;CPRange.jt;1733;@STATIC;1.0;t;1714;CPMakeRange= function(location, length)
{
    return { location: location, length: length };
}
CPCopyRange= function(aRange)
{
    return { location: aRange.location, length: aRange.length };
}
CPMakeRangeCopy= function(aRange)
{
    return { location:aRange.location, length:aRange.length };
}
CPEmptyRange= function(aRange)
{
    return aRange.length === 0;
}
CPMaxRange= function(aRange)
{
    return aRange.location + aRange.length;
}
CPEqualRanges= function(lhsRange, rhsRange)
{
    return ((lhsRange.location === rhsRange.location) && (lhsRange.length === rhsRange.length));
}
CPLocationInRange= function(aLocation, aRange)
{
    return (aLocation >= aRange.location) && (aLocation < CPMaxRange(aRange));
}
CPUnionRange= function(lhsRange, rhsRange)
{
    var location = MIN(lhsRange.location, rhsRange.location);
    return CPMakeRange(location, MAX(CPMaxRange(lhsRange), CPMaxRange(rhsRange)) - location);
}
CPIntersectionRange= function(lhsRange, rhsRange)
{
    if(CPMaxRange(lhsRange) < rhsRange.location || CPMaxRange(rhsRange) < lhsRange.location)
        return CPMakeRange(0, 0);
    var location = MAX(lhsRange.location, rhsRange.location);
    return CPMakeRange(location, MIN(CPMaxRange(lhsRange), CPMaxRange(rhsRange)) - location);
}
CPRangeInRange= function(lhsRange, rhsRange)
{
    return (lhsRange.location <= rhsRange.location && CPMaxRange(lhsRange) >= CPMaxRange(rhsRange));
}
CPStringFromRange= function(aRange)
{
    return "{" + aRange.location + ", " + aRange.length + "}";
}
CPRangeFromString= function(aString)
{
    var comma = aString.indexOf(',');
    return { location:parseInt(aString.substr(1, comma - 1)), length:parseInt(aString.substring(comma + 1, aString.length)) };
}

p;11;CPRunLoop.jt;9043;@STATIC;1.0;i;10;CPObject.ji;9;CPArray.ji;10;CPString.jt;8981;objj_executeFile("CPObject.j", true);
objj_executeFile("CPArray.j", true);
objj_executeFile("CPString.j", true);
CPDefaultRunLoopMode = "CPDefaultRunLoopMode";
_CPRunLoopPerformCompare= function(lhs, rhs)
{
    return objj_msgSend(rhs, "order") - objj_msgSend(lhs, "order");
}
var _CPRunLoopPerformPool = [],
    _CPRunLoopPerformPoolCapacity = 5;
{var the_class = objj_allocateClassPair(CPObject, "_CPRunLoopPerform"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_target"), new objj_ivar("_selector"), new objj_ivar("_argument"), new objj_ivar("_order"), new objj_ivar("_runLoopModes"), new objj_ivar("_isValid")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithSelector:target:argument:order:modes:"), function(self, _cmd, aSelector, aTarget, anArgument, anOrder, modes)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRunLoopPerform").super_class }, "init");
    if (self)
    {
        _selector = aSelector;
        _target = aTarget;
        _argument = anArgument;
        _order = anOrder;
        _runLoopModes = modes;
        _isValid = YES;
    }
    return self;
}
}), new objj_method(sel_getUid("selector"), function(self, _cmd)
{ with(self)
{
    return _selector;
}
}), new objj_method(sel_getUid("target"), function(self, _cmd)
{ with(self)
{
    return _target;
}
}), new objj_method(sel_getUid("argument"), function(self, _cmd)
{ with(self)
{
    return _argument;
}
}), new objj_method(sel_getUid("order"), function(self, _cmd)
{ with(self)
{
    return _order;
}
}), new objj_method(sel_getUid("fireInMode:"), function(self, _cmd, aRunLoopMode)
{ with(self)
{
    if (!_isValid)
        return YES;
    if (objj_msgSend(_runLoopModes, "containsObject:", aRunLoopMode))
    {
        objj_msgSend(_target, "performSelector:withObject:", _selector, _argument);
        return YES;
    }
    return NO;
}
}), new objj_method(sel_getUid("invalidate"), function(self, _cmd)
{ with(self)
{
    _isValid = NO;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_poolPerform:"), function(self, _cmd, aPerform)
{ with(self)
{
    if (!aPerform || _CPRunLoopPerformPool.length >= _CPRunLoopPerformPoolCapacity)
        return;
    _CPRunLoopPerformPool.push(aPerform);
}
}), new objj_method(sel_getUid("performWithSelector:target:argument:order:modes:"), function(self, _cmd, aSelector, aTarget, anArgument, anOrder, modes)
{ with(self)
{
    if (_CPRunLoopPerformPool.length)
    {
        var perform = _CPRunLoopPerformPool.pop();
        perform._target = aTarget;
        perform._selector = aSelector;
        perform._argument = anArgument;
        perform._order = anOrder;
        perform._runLoopModes = modes;
        perform._isValid = YES;
        return perform;
    }
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithSelector:target:argument:order:modes:", aSelector, aTarget, anArgument, anOrder, modes);
}
})]);
}
var CPRunLoopLastNativeRunLoop = 0;
{var the_class = objj_allocateClassPair(CPObject, "CPRunLoop"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_runLoopLock"), new objj_ivar("_timersForModes"), new objj_ivar("_nativeTimersForModes"), new objj_ivar("_nextTimerFireDatesForModes"), new objj_ivar("_didAddTimer"), new objj_ivar("_effectiveDate"), new objj_ivar("_orderedPerforms")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRunLoop").super_class }, "init");
    if (self)
    {
        _orderedPerforms = [];
        _timersForModes = {};
        _nativeTimersForModes = {};
        _nextTimerFireDatesForModes = {};
    }
    return self;
}
}), new objj_method(sel_getUid("performSelector:target:argument:order:modes:"), function(self, _cmd, aSelector, aTarget, anArgument, anOrder, modes)
{ with(self)
{
    var perform = objj_msgSend(_CPRunLoopPerform, "performWithSelector:target:argument:order:modes:", aSelector, aTarget, anArgument, anOrder, modes),
        count = _orderedPerforms.length;
    while (count--)
        if (anOrder < objj_msgSend(_orderedPerforms[count], "order"))
            break;
    _orderedPerforms.splice(count + 1, 0, perform);
}
}), new objj_method(sel_getUid("cancelPerformSelector:target:argument:"), function(self, _cmd, aSelector, aTarget, anArgument)
{ with(self)
{
    var count = _orderedPerforms.length;
    while (count--)
    {
        var perform = _orderedPerforms[count];
        if (objj_msgSend(perform, "selector") === aSelector && objj_msgSend(perform, "target") == aTarget && objj_msgSend(perform, "argument") == anArgument)
            objj_msgSend(_orderedPerforms[count], "invalidate");
    }
}
}), new objj_method(sel_getUid("performSelectors"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "limitDateForMode:", CPDefaultRunLoopMode);
}
}), new objj_method(sel_getUid("addTimer:forMode:"), function(self, _cmd, aTimer, aMode)
{ with(self)
{
    if (_timersForModes[aMode])
        _timersForModes[aMode].push(aTimer);
    else
        _timersForModes[aMode] = [aTimer];
    _didAddTimer = YES;
    if (!aTimer._lastNativeRunLoopsForModes)
        aTimer._lastNativeRunLoopsForModes = {};
    aTimer._lastNativeRunLoopsForModes[aMode] = CPRunLoopLastNativeRunLoop;
}
}), new objj_method(sel_getUid("limitDateForMode:"), function(self, _cmd, aMode)
{ with(self)
{
    if (_runLoopLock)
        return;
    _runLoopLock = YES;
    var now = _effectiveDate ? objj_msgSend(_effectiveDate, "laterDate:", objj_msgSend(CPDate, "date")) : objj_msgSend(CPDate, "date"),
        nextFireDate = nil,
        nextTimerFireDate = _nextTimerFireDatesForModes[aMode];
    if (_didAddTimer || nextTimerFireDate && nextTimerFireDate <= now)
    {
        _didAddTimer = NO;
        if (_nativeTimersForModes[aMode] !== nil)
        {
            window.clearNativeTimeout(_nativeTimersForModes[aMode]);
            _nativeTimersForModes[aMode] = nil;
        }
        var timers = _timersForModes[aMode],
            index = timers.length;
        _timersForModes[aMode] = nil;
        while (index--)
        {
            var timer = timers[index];
            if (timer._lastNativeRunLoopsForModes[aMode] < CPRunLoopLastNativeRunLoop && timer._isValid && timer._fireDate <= now)
                objj_msgSend(timer, "fire");
            if (timer._isValid)
                nextFireDate = (nextFireDate === nil) ? timer._fireDate : objj_msgSend(nextFireDate, "earlierDate:", timer._fireDate);
            else
            {
                timer._lastNativeRunLoopsForModes[aMode] = 0;
                timers.splice(index, 1);
            }
        }
        var newTimers = _timersForModes[aMode];
        if (newTimers && newTimers.length)
        {
            index = newTimers.length;
            while (index--)
            {
                var timer = newTimers[index];
                if (objj_msgSend(timer, "isValid"))
                    nextFireDate = (nextFireDate === nil) ? timer._fireDate : objj_msgSend(nextFireDate, "earlierDate:", timer._fireDate);
                else
                    newTimers.splice(index, 1);
            }
            _timersForModes[aMode] = newTimers.concat(timers);
        }
        else
            _timersForModes[aMode] = timers;
        _nextTimerFireDatesForModes[aMode] = nextFireDate;
        if (_nextTimerFireDatesForModes[aMode] !== nil)
            _nativeTimersForModes[aMode] = window.setNativeTimeout(function() { _effectiveDate = nextFireDate; _nativeTimersForModes[aMode] = nil; ++CPRunLoopLastNativeRunLoop; objj_msgSend(self, "limitDateForMode:", aMode); _effectiveDate = nil; }, MAX(0, objj_msgSend(nextFireDate, "timeIntervalSinceNow") * 1000));
    }
    var performs = _orderedPerforms,
        index = performs.length;
    _orderedPerforms = [];
    while (index--)
    {
        var perform = performs[index];
        if (objj_msgSend(perform, "fireInMode:", CPDefaultRunLoopMode))
        {
            objj_msgSend(_CPRunLoopPerform, "_poolPerform:", perform);
            performs.splice(index, 1);
        }
    }
    if (_orderedPerforms.length)
    {
        _orderedPerforms = _orderedPerforms.concat(performs);
        _orderedPerforms.sort(_CPRunLoopPerformCompare);
    }
    else
        _orderedPerforms = performs;
    _runLoopLock = NO;
    return nextFireDate;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPRunLoop, "class"))
        return;
    CPMainRunLoop = objj_msgSend(objj_msgSend(CPRunLoop, "alloc"), "init");
}
}), new objj_method(sel_getUid("currentRunLoop"), function(self, _cmd)
{ with(self)
{
    return CPMainRunLoop;
}
}), new objj_method(sel_getUid("mainRunLoop"), function(self, _cmd)
{ with(self)
{
    return CPMainRunLoop;
}
})]);
}

p;7;CPSet.jt;10499;@STATIC;1.0;i;10;CPObject.ji;9;CPArray.ji;10;CPNumber.ji;14;CPEnumerator.jt;10417;objj_executeFile("CPObject.j", true);
objj_executeFile("CPArray.j", true);
objj_executeFile("CPNumber.j", true);
objj_executeFile("CPEnumerator.j", true);
{var the_class = objj_allocateClassPair(CPObject, "CPSet"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contents"), new objj_ivar("_count")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSet").super_class }, "init"))
    {
        _count = 0;
        _contents = {};
    }
    return self;
}
}), new objj_method(sel_getUid("initWithArray:"), function(self, _cmd, anArray)
{ with(self)
{
    if (self = objj_msgSend(self, "init"))
    {
        var count = anArray.length;
        while (count--)
            objj_msgSend(self, "addObject:", anArray[count]);
    }
    return self;
}
}), new objj_method(sel_getUid("initWithObjects:count:"), function(self, _cmd, objects, count)
{ with(self)
{
    return objj_msgSend(self, "initWithArray:", objects.splice(0, count));
}
}), new objj_method(sel_getUid("initWithObjects:"), function(self, _cmd, anObject)
{ with(self)
{
    if (self = objj_msgSend(self, "init"))
    {
  var argLength = arguments.length,
   i = 2;
        for(; i < argLength && (argument = arguments[i]) != nil; ++i)
            objj_msgSend(self, "addObject:", argument);
    }
    return self;
}
}), new objj_method(sel_getUid("initWithSet:"), function(self, _cmd, aSet)
{ with(self)
{
    return objj_msgSend(self, "initWithSet:copyItems:", aSet, NO);
}
}), new objj_method(sel_getUid("initWithSet:copyItems:"), function(self, _cmd, aSet, shouldCopyItems)
{ with(self)
{
    self = objj_msgSend(self, "init");
    if (!aSet)
        return self;
    var contents = aSet._contents;
    for (var property in contents)
    {
        if (contents.hasOwnProperty(property))
        {
            if (shouldCopyItems)
                objj_msgSend(self, "addObject:", objj_msgSend(contents[property], "copy"));
            else
                objj_msgSend(self, "addObject:", contents[property]);
        }
    }
    return self;
}
}), new objj_method(sel_getUid("allObjects"), function(self, _cmd)
{ with(self)
{
    var array = [];
    for (var property in _contents)
    {
        if (_contents.hasOwnProperty(property))
            array.push(_contents[property]);
    }
    return array;
}
}), new objj_method(sel_getUid("anyObject"), function(self, _cmd)
{ with(self)
{
    for (var property in _contents)
    {
        if (_contents.hasOwnProperty(property))
            return _contents[property];
    }
    return nil;
}
}), new objj_method(sel_getUid("containsObject:"), function(self, _cmd, anObject)
{ with(self)
{
    var obj = _contents[objj_msgSend(anObject, "UID")];
    if (obj !== undefined && objj_msgSend(obj, "isEqual:", anObject))
        return YES;
    return NO;
}
}), new objj_method(sel_getUid("count"), function(self, _cmd)
{ with(self)
{
    return _count;
}
}), new objj_method(sel_getUid("intersectsSet:"), function(self, _cmd, aSet)
{ with(self)
{
    if (self === aSet)
        return YES;
    var objects = objj_msgSend(aSet, "allObjects"),
        count = objj_msgSend(objects, "count");
    while (count--)
        if (objj_msgSend(self, "containsObject:", objects[count]))
            return YES;
    return NO;
}
}), new objj_method(sel_getUid("isEqualToSet:"), function(self, _cmd, set)
{ with(self)
{
    return self === set || (objj_msgSend(self, "count") === objj_msgSend(set, "count") && objj_msgSend(set, "isSubsetOfSet:", self));
}
}), new objj_method(sel_getUid("isSubsetOfSet:"), function(self, _cmd, set)
{ with(self)
{
    var items = objj_msgSend(self, "allObjects");
    for (var i = 0; i < items.length; i++)
    {
        if (!objj_msgSend(set, "containsObject:", items[i]))
            return NO;
    }
    return YES;
}
}), new objj_method(sel_getUid("makeObjectsPerformSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    objj_msgSend(self, "makeObjectsPerformSelector:withObject:", aSelector, nil);
}
}), new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"), function(self, _cmd, aSelector, argument)
{ with(self)
{
    var items = objj_msgSend(self, "allObjects");
    for (var i = 0; i < items.length; i++)
    {
        objj_msgSend(items[i], "performSelector:withObject:", aSelector, argument);
    }
}
}), new objj_method(sel_getUid("member:"), function(self, _cmd, object)
{ with(self)
{
    if (objj_msgSend(self, "containsObject:", object))
        return object;
    return nil;
}
}), new objj_method(sel_getUid("objectEnumerator"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "allObjects"), "objectEnumerator");
}
}), new objj_method(sel_getUid("initWithCapacity:"), function(self, _cmd, numItems)
{ with(self)
{
    self = objj_msgSend(self, "init");
    return self;
}
}), new objj_method(sel_getUid("setSet:"), function(self, _cmd, set)
{ with(self)
{
    objj_msgSend(self, "removeAllObjects");
    objj_msgSend(self, "addObjectsFromArray:", objj_msgSend(set, "allObjects"));
}
}), new objj_method(sel_getUid("addObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (objj_msgSend(self, "containsObject:", anObject))
        return;
    _contents[objj_msgSend(anObject, "UID")] = anObject;
    _count++;
}
}), new objj_method(sel_getUid("addObjectsFromArray:"), function(self, _cmd, objects)
{ with(self)
{
    var count = objj_msgSend(objects, "count");
    while (count--)
        objj_msgSend(self, "addObject:", objects[count]);
}
}), new objj_method(sel_getUid("removeObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (objj_msgSend(self, "containsObject:", anObject))
    {
        delete _contents[objj_msgSend(anObject, "UID")];
        _count--;
    }
}
}), new objj_method(sel_getUid("removeObjectsInArray:"), function(self, _cmd, objects)
{ with(self)
{
    var count = objj_msgSend(objects, "count");
    while (count--)
        objj_msgSend(self, "removeObject:", objects[count]);
}
}), new objj_method(sel_getUid("removeAllObjects"), function(self, _cmd)
{ with(self)
{
    _contents = {};
    _count = 0;
}
}), new objj_method(sel_getUid("intersectSet:"), function(self, _cmd, set)
{ with(self)
{
    var items = objj_msgSend(self, "allObjects");
    for (var i = 0, count = items.length; i < count; i++)
    {
        if (!objj_msgSend(set, "containsObject:", items[i]))
            objj_msgSend(self, "removeObject:", items[i]);
    }
}
}), new objj_method(sel_getUid("minusSet:"), function(self, _cmd, set)
{ with(self)
{
    var items = objj_msgSend(set, "allObjects");
    for (var i = 0; i < items.length; i++)
    {
        if (objj_msgSend(self, "containsObject:", items[i]))
            objj_msgSend(self, "removeObject:", items[i]);
    }
}
}), new objj_method(sel_getUid("unionSet:"), function(self, _cmd, set)
{ with(self)
{
    var items = objj_msgSend(set, "allObjects");
    for (var i = 0, count = items.length; i < count; i++)
    {
        objj_msgSend(self, "addObject:", items[i]);
    }
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("set"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
}), new objj_method(sel_getUid("setWithArray:"), function(self, _cmd, array)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithArray:", array);
}
}), new objj_method(sel_getUid("setWithObject:"), function(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithArray:", [anObject]);
}
}), new objj_method(sel_getUid("setWithObjects:count:"), function(self, _cmd, objects, count)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithObjects:count:", objects, count);
}
}), new objj_method(sel_getUid("setWithObjects:"), function(self, _cmd, anObject)
{ with(self)
{
    var set = objj_msgSend(objj_msgSend(self, "alloc"), "init"),
        argLength = arguments.length,
        i = 2;
    for(; i < argLength && ((argument = arguments[i]) !== nil); ++i)
        objj_msgSend(set, "addObject:", argument);
    return set;
}
}), new objj_method(sel_getUid("setWithSet:"), function(self, _cmd, set)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithSet:", set);
}
}), new objj_method(sel_getUid("setWithCapacity:"), function(self, _cmd, numItems)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithCapacity:", numItems);
}
})]);
}
{
var the_class = objj_getClass("CPSet")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPSet, "alloc"), "initWithSet:", self);
}
}), new objj_method(sel_getUid("mutableCopy"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "copy");
}
})]);
}
var CPSetObjectsKey = "CPSetObjectsKey";
{
var the_class = objj_getClass("CPSet")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "initWithArray:", objj_msgSend(aCoder, "decodeObjectForKey:", CPSetObjectsKey));
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "allObjects"), CPSetObjectsKey);
}
})]);
}
{
var the_class = objj_getClass("CPSet")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("countByEnumeratingWithState:objects:count:"), function(self, _cmd, aState, objects, aCount)
{ with(self)
{
    var count = objj_msgSend(self, "count");
    if (aState.state >= count)
        return 0;
    count = objj_msgSend(objj_msgSend(self, "allObjects"), "countByEnumeratingWithState:objects:count:", aState, objects, aCount);
    return count;
}
})]);
}
{var the_class = objj_allocateClassPair(CPSet, "CPMutableSet"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}

p;18;CPSortDescriptor.jt;2460;@STATIC;1.0;i;10;CPObject.ji;15;CPObjJRuntime.jt;2406;objj_executeFile("CPObject.j", true);
objj_executeFile("CPObjJRuntime.j", true);
CPOrderedAscending = -1;
CPOrderedSame = 0;
CPOrderedDescending = 1;
{var the_class = objj_allocateClassPair(CPObject, "CPSortDescriptor"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_key"), new objj_ivar("_selector"), new objj_ivar("_ascending")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithKey:ascending:"), function(self, _cmd, aKey, isAscending)
{ with(self)
{
    return objj_msgSend(self, "initWithKey:ascending:selector:", aKey, isAscending, sel_getUid("compare:"));
}
}), new objj_method(sel_getUid("initWithKey:ascending:selector:"), function(self, _cmd, aKey, isAscending, aSelector)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSortDescriptor").super_class }, "init");
    if (self)
    {
        _key = aKey;
        _ascending = isAscending;
        _selector = aSelector;
    }
    return self;
}
}), new objj_method(sel_getUid("ascending"), function(self, _cmd)
{ with(self)
{
    return _ascending;
}
}), new objj_method(sel_getUid("key"), function(self, _cmd)
{ with(self)
{
    return _key;
}
}), new objj_method(sel_getUid("selector"), function(self, _cmd)
{ with(self)
{
    return _selector;
}
}), new objj_method(sel_getUid("compareObject:withObject:"), function(self, _cmd, lhsObject, rhsObject)
{ with(self)
{
    return (_ascending ? 1 : -1) * objj_msgSend(objj_msgSend(lhsObject, "valueForKeyPath:", _key), "performSelector:withObject:", _selector, objj_msgSend(rhsObject, "valueForKeyPath:", _key));
}
}), new objj_method(sel_getUid("reversedSortDescriptor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithKey:ascending:selector:", _key, !_ascending, _selector);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sortDescriptorWithKey:ascending:"), function(self, _cmd, aKey, isAscending)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithKey:ascending:", aKey, isAscending);
}
}), new objj_method(sel_getUid("sortDescriptorWithKey:ascending:selector:"), function(self, _cmd, aKey, isAscending, aSelector)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithKey:ascending:selector:", aKey, isAscending, aSelector);
}
})]);
}

p;10;CPString.jt;13012;@STATIC;1.0;i;10;CPObject.ji;13;CPException.ji;18;CPSortDescriptor.ji;9;CPValue.jt;12923;objj_executeFile("CPObject.j", true);
objj_executeFile("CPException.j", true);
objj_executeFile("CPSortDescriptor.j", true);
objj_executeFile("CPValue.j", true);
CPCaseInsensitiveSearch = 1;
CPLiteralSearch = 2;
CPBackwardsSearch = 4;
CPAnchoredSearch = 8;
CPNumericSearch = 64;
var CPStringHashes = new CFMutableDictionary();
var CPStringRegexSpecialCharacters = [
      '/', '.', '*', '+', '?', '|', '$', '^',
      '(', ')', '[', ']', '{', '}', '\\'
    ],
    CPStringRegexEscapeExpression = new RegExp("(\\" + CPStringRegexSpecialCharacters.join("|\\") + ")", 'g'),
    CPStringRegexTrimWhitespace = new RegExp("(^\\s+|\\s+$)", 'g');
{var the_class = objj_allocateClassPair(CPObject, "CPString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithString:"), function(self, _cmd, aString)
{ with(self)
{
    return String(aString);
}
}), new objj_method(sel_getUid("initWithFormat:"), function(self, _cmd, format)
{ with(self)
{
    if (!format)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "initWithFormat: the format can't be 'nil'");
    self = sprintf.apply(this, Array.prototype.slice.call(arguments, 2));
    return self;
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("length"), function(self, _cmd)
{ with(self)
{
    return length;
}
}), new objj_method(sel_getUid("characterAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return charAt(anIndex);
}
}), new objj_method(sel_getUid("stringByAppendingFormat:"), function(self, _cmd, format)
{ with(self)
{
    if (!format)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "initWithFormat: the format can't be 'nil'");
    return self + sprintf.apply(this, Array.prototype.slice.call(arguments, 2));
}
}), new objj_method(sel_getUid("stringByAppendingString:"), function(self, _cmd, aString)
{ with(self)
{
    return self + aString;
}
}), new objj_method(sel_getUid("stringByPaddingToLength:withString:startingAtIndex:"), function(self, _cmd, aLength, aString, anIndex)
{ with(self)
{
    if (length == aLength)
        return self;
    if (aLength < length)
        return substr(0, aLength);
    var string = self,
        substring = aString.substring(anIndex),
        difference = aLength - length;
    while ((difference -= substring.length) >= 0)
        string += substring;
    if (-difference < substring.length)
        string += substring.substring(0, -difference);
    return string;
}
}), new objj_method(sel_getUid("componentsSeparatedByString:"), function(self, _cmd, aString)
{ with(self)
{
    return split(aString);
}
}), new objj_method(sel_getUid("substringFromIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return substr(anIndex);
}
}), new objj_method(sel_getUid("substringWithRange:"), function(self, _cmd, aRange)
{ with(self)
{
    return substr(aRange.location, aRange.length);
}
}), new objj_method(sel_getUid("substringToIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return substring(0, anIndex);
}
}), new objj_method(sel_getUid("rangeOfString:"), function(self, _cmd, aString)
{ with(self)
{
   return objj_msgSend(self, "rangeOfString:options:", aString, 0);
}
}), new objj_method(sel_getUid("rangeOfString:options:"), function(self, _cmd, aString, aMask)
{ with(self)
{
    return objj_msgSend(self, "rangeOfString:options:range:", aString, aMask, nil);
}
}), new objj_method(sel_getUid("rangeOfString:options:range:"), function(self, _cmd, aString, aMask, aRange)
{ with(self)
{
    var string = (aRange == nil) ? self : objj_msgSend(self, "substringWithRange:", aRange),
        location = CPNotFound;
    if (aMask & CPCaseInsensitiveSearch)
    {
        string = string.toLowerCase();
        aString = aString.toLowerCase();
    }
    if (aMask & CPBackwardsSearch)
        location = string.lastIndexOf(aString, aMask & CPAnchoredSearch ? length - aString.length : 0);
    else if (aMask & CPAnchoredSearch)
        location = string.substr(0, aString.length).indexOf(aString) != CPNotFound ? 0 : CPNotFound;
    else
        location = string.indexOf(aString);
    return CPMakeRange(location, location == CPNotFound ? 0 : aString.length);
}
}), new objj_method(sel_getUid("stringByEscapingRegexControlCharacters"), function(self, _cmd)
{ with(self)
{
    return self.replace(CPStringRegexEscapeExpression, "\\$1");
}
}), new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:"), function(self, _cmd, target, replacement)
{ with(self)
{
    return self.replace(new RegExp(objj_msgSend(target, "stringByEscapingRegexControlCharacters"), "g"), replacement);
}
}), new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:options:range:"), function(self, _cmd, target, replacement, options, searchRange)
{ with(self)
{
    var start = substring(0, searchRange.location),
        stringSegmentToSearch = substr(searchRange.location, searchRange.length),
        end = substring(searchRange.location + searchRange.length, self.length),
        target = objj_msgSend(target, "stringByEscapingRegexControlCharacters"),
        regExp;
    if (options & CPCaseInsensitiveSearch)
        regExp = new RegExp(target, "gi");
    else
        regExp = new RegExp(target, "g");
    return start + '' + stringSegmentToSearch.replace(regExp, replacement) + '' + end;
}
}), new objj_method(sel_getUid("stringByReplacingCharactersInRange:withString:"), function(self, _cmd, range, replacement)
{ with(self)
{
 return '' + substring(0, range.location) + replacement + substring(range.location + range.length, self.length);
}
}), new objj_method(sel_getUid("stringByTrimmingWhitespace"), function(self, _cmd)
{ with(self)
{
    return self.replace(CPStringRegexTrimWhitespace, "");
}
}), new objj_method(sel_getUid("compare:"), function(self, _cmd, aString)
{ with(self)
{
    return objj_msgSend(self, "compare:options:", aString, nil);
}
}), new objj_method(sel_getUid("caseInsensitiveCompare:"), function(self, _cmd, aString)
{ with(self)
{
    return objj_msgSend(self, "compare:options:", aString, CPCaseInsensitiveSearch);
}
}), new objj_method(sel_getUid("compare:options:"), function(self, _cmd, aString, aMask)
{ with(self)
{
    var lhs = self,
        rhs = aString;
    if (aMask & CPCaseInsensitiveSearch)
    {
        lhs = lhs.toLowerCase();
        rhs = rhs.toLowerCase();
    }
    if (lhs < rhs)
        return CPOrderedAscending;
    else if (lhs > rhs)
        return CPOrderedDescending;
    return CPOrderedSame;
}
}), new objj_method(sel_getUid("compare:options:range:"), function(self, _cmd, aString, aMask, range)
{ with(self)
{
    var lhs = objj_msgSend(self, "substringWithRange:", range),
        rhs = aString;
    return objj_msgSend(lhs, "compare:options:", rhs, aMask);
}
}), new objj_method(sel_getUid("hasPrefix:"), function(self, _cmd, aString)
{ with(self)
{
    return aString && aString != "" && indexOf(aString) == 0;
}
}), new objj_method(sel_getUid("hasSuffix:"), function(self, _cmd, aString)
{ with(self)
{
    return aString && aString != "" && length >= aString.length && lastIndexOf(aString) == (length - aString.length);
}
}), new objj_method(sel_getUid("isEqualToString:"), function(self, _cmd, aString)
{ with(self)
{
    return self == aString;
}
}), new objj_method(sel_getUid("UID"), function(self, _cmd)
{ with(self)
{
    var hash = CPStringHashes.valueForKey(self);
    if (!hash)
    {
        hash = _objj_generateObjectHash();
        CPStringHashes.setValueForKey(self, hash);
    }
    return hash;
}
}), new objj_method(sel_getUid("commonPrefixWithString:"), function(self, _cmd, aString)
{ with(self)
{
    return objj_msgSend(self, "commonPrefixWithString:options:",  aString,  0);
}
}), new objj_method(sel_getUid("commonPrefixWithString:options:"), function(self, _cmd, aString, aMask)
{ with(self)
{
    var len = 0,
        lhs = self,
        rhs = aString,
        min = MIN(objj_msgSend(lhs, "length"), objj_msgSend(rhs, "length"));
    if (aMask & CPCaseInsensitiveSearch)
    {
        lhs = objj_msgSend(lhs, "lowercaseString");
        rhs = objj_msgSend(rhs, "lowercaseString");
    }
    for (; len < min; len++ )
    {
        if ( objj_msgSend(lhs, "characterAtIndex:", len) !== objj_msgSend(rhs, "characterAtIndex:", len) )
            break;
    }
    return objj_msgSend(self, "substringToIndex:", len);
}
}), new objj_method(sel_getUid("capitalizedString"), function(self, _cmd)
{ with(self)
{
    var parts = self.split(/\b/g);
    for (var i = 0; i < parts.length; i++)
    {
        if (i == 0 || (/\s$/).test(parts[i-1]))
            parts[i] = parts[i].substring(0, 1).toUpperCase() + parts[i].substring(1).toLowerCase();
        else
            parts[i] = parts[i].toLowerCase();
    }
    return parts.join("");
}
}), new objj_method(sel_getUid("lowercaseString"), function(self, _cmd)
{ with(self)
{
    return toLowerCase();
}
}), new objj_method(sel_getUid("uppercaseString"), function(self, _cmd)
{ with(self)
{
    return toUpperCase();
}
}), new objj_method(sel_getUid("doubleValue"), function(self, _cmd)
{ with(self)
{
    return parseFloat(self, 10);
}
}), new objj_method(sel_getUid("boolValue"), function(self, _cmd)
{ with(self)
{
    var replaceRegExp = new RegExp("^\\s*[\\+,\\-]*0*");
    return RegExp("^[Y,y,t,T,1-9]").test(self.replace(replaceRegExp, ''));
}
}), new objj_method(sel_getUid("floatValue"), function(self, _cmd)
{ with(self)
{
    return parseFloat(self, 10);
}
}), new objj_method(sel_getUid("intValue"), function(self, _cmd)
{ with(self)
{
    return parseInt(self, 10);
}
}), new objj_method(sel_getUid("pathComponents"), function(self, _cmd)
{ with(self)
{
    var result = split('/');
    if (result[0] === "")
        result[0] = "/";
    if (result[result.length - 1] === "")
        result.pop();
    return result;
}
}), new objj_method(sel_getUid("pathExtension"), function(self, _cmd)
{ with(self)
{
    return substr(lastIndexOf('.') + 1);
}
}), new objj_method(sel_getUid("lastPathComponent"), function(self, _cmd)
{ with(self)
{
    var components = objj_msgSend(self, "pathComponents");
    return components[components.length -1];
}
}), new objj_method(sel_getUid("stringByDeletingLastPathComponent"), function(self, _cmd)
{ with(self)
{
    var path = self,
        start = length - 1;
    while (path.charAt(start) === '/')
        start--;
    path = path.substr(0, path.lastIndexOf('/', start));
    if (path === "" && charAt(0) === '/')
        return '/';
    return path;
}
}), new objj_method(sel_getUid("stringByStandardizingPath"), function(self, _cmd)
{ with(self)
{
    return objj_standardize_path(self);
}
}), new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    return new String(self);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return new String;
}
}), new objj_method(sel_getUid("string"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
}), new objj_method(sel_getUid("stringWithHash:"), function(self, _cmd, aHash)
{ with(self)
{
    var hashString = parseInt(aHash, 10).toString(16);
    return "000000".substring(0, MAX(6-hashString.length, 0)) + hashString;
}
}), new objj_method(sel_getUid("stringWithString:"), function(self, _cmd, aString)
{ with(self)
{
    if (!aString)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "stringWithString: the string can't be 'nil'");
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithString:", aString);
}
}), new objj_method(sel_getUid("stringWithFormat:"), function(self, _cmd, format)
{ with(self)
{
    if (!format)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "initWithFormat: the format can't be 'nil'");
    return sprintf.apply(this, Array.prototype.slice.call(arguments, 2));
}
})]);
}
{
var the_class = objj_getClass("CPString")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPString\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("objectFromJSON"), function(self, _cmd)
{ with(self)
{
    return JSON.parse(self);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("JSONFromObject:"), function(self, _cmd, anObject)
{ with(self)
{
    return JSON.stringify(anObject);
}
})]);
}
{
var the_class = objj_getClass("CPString")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPString\"");
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("UUID"), function(self, _cmd)
{ with(self)
{
    var g = "";
    for(var i = 0; i < 32; i++)
        g += FLOOR(RAND() * 0xF).toString(0xF);
    return g;
}
})]);
}
String.prototype.isa = CPString;

p;9;CPTimer.jt;7391;@STATIC;1.0;i;10;CPObject.ji;14;CPInvocation.ji;8;CPDate.ji;11;CPRunLoop.jt;7310;objj_executeFile("CPObject.j", true);
objj_executeFile("CPInvocation.j", true);
objj_executeFile("CPDate.j", true);
objj_executeFile("CPRunLoop.j", true);
{var the_class = objj_allocateClassPair(CPObject, "CPTimer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_timeInterval"), new objj_ivar("_invocation"), new objj_ivar("_callback"), new objj_ivar("_repeats"), new objj_ivar("_isValid"), new objj_ivar("_fireDate"), new objj_ivar("_userInfo")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFireDate:interval:invocation:repeats:"), function(self, _cmd, aDate, seconds, anInvocation, shouldRepeat)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTimer").super_class }, "init");
    if (self)
    {
        _timeInterval = seconds;
        _invocation = anInvocation;
        _repeats = shouldRepeat;
        _isValid = YES;
        _fireDate = aDate;
    }
    return self;
}
}), new objj_method(sel_getUid("initWithFireDate:interval:target:selector:userInfo:repeats:"), function(self, _cmd, aDate, seconds, aTarget, aSelector, userInfo, shouldRepeat)
{ with(self)
{
    var invocation = objj_msgSend(CPInvocation, "invocationWithMethodSignature:", 1);
    objj_msgSend(invocation, "setTarget:", aTarget);
    objj_msgSend(invocation, "setSelector:", aSelector);
    objj_msgSend(invocation, "setArgument:atIndex:", self, 2);
    self = objj_msgSend(self, "initWithFireDate:interval:invocation:repeats:", aDate, seconds, invocation, shouldRepeat);
    if (self)
        _userInfo = userInfo;
    return self;
}
}), new objj_method(sel_getUid("initWithFireDate:interval:callback:repeats:"), function(self, _cmd, aDate, seconds, aFunction, shouldRepeat)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTimer").super_class }, "init");
    if (self)
    {
        _timeInterval = seconds;
        _callback = aFunction;
        _repeats = shouldRepeat;
        _isValid = YES;
        _fireDate = aDate;
    }
    return self;
}
}), new objj_method(sel_getUid("timeInterval"), function(self, _cmd)
{ with(self)
{
   return _timeInterval;
}
}), new objj_method(sel_getUid("fireDate"), function(self, _cmd)
{ with(self)
{
   return _fireDate;
}
}), new objj_method(sel_getUid("setFireDate:"), function(self, _cmd, aDate)
{ with(self)
{
    _fireDate = aDate;
}
}), new objj_method(sel_getUid("fire"), function(self, _cmd)
{ with(self)
{
    if (!_isValid)
        return;
    if (_callback)
        _callback();
    else
        objj_msgSend(_invocation, "invoke");
    if (!_isValid)
        return;
    if (_repeats)
        _fireDate = objj_msgSend(CPDate, "dateWithTimeIntervalSinceNow:", _timeInterval);
    else
        objj_msgSend(self, "invalidate");
}
}), new objj_method(sel_getUid("isValid"), function(self, _cmd)
{ with(self)
{
   return _isValid;
}
}), new objj_method(sel_getUid("invalidate"), function(self, _cmd)
{ with(self)
{
   _isValid = NO;
   _userInfo = nil;
   _invocation = nil;
   _callback = nil;
}
}), new objj_method(sel_getUid("userInfo"), function(self, _cmd)
{ with(self)
{
   return _userInfo;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("scheduledTimerWithTimeInterval:invocation:repeats:"), function(self, _cmd, seconds, anInvocation, shouldRepeat)
{ with(self)
{
    var timer = objj_msgSend(objj_msgSend(self, "alloc"), "initWithFireDate:interval:invocation:repeats:", objj_msgSend(CPDate, "dateWithTimeIntervalSinceNow:", seconds), seconds, anInvocation, shouldRepeat);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "addTimer:forMode:", timer, CPDefaultRunLoopMode);
    return timer;
}
}), new objj_method(sel_getUid("scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:"), function(self, _cmd, seconds, aTarget, aSelector, userInfo, shouldRepeat)
{ with(self)
{
    var timer = objj_msgSend(objj_msgSend(self, "alloc"), "initWithFireDate:interval:target:selector:userInfo:repeats:", objj_msgSend(CPDate, "dateWithTimeIntervalSinceNow:", seconds), seconds, aTarget, aSelector, userInfo, shouldRepeat)
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "addTimer:forMode:", timer, CPDefaultRunLoopMode);
    return timer;
}
}), new objj_method(sel_getUid("scheduledTimerWithTimeInterval:callback:repeats:"), function(self, _cmd, seconds, aFunction, shouldRepeat)
{ with(self)
{
    var timer = objj_msgSend(objj_msgSend(self, "alloc"), "initWithFireDate:interval:callback:repeats:", objj_msgSend(CPDate, "dateWithTimeIntervalSinceNow:", seconds), seconds, aFunction, shouldRepeat);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "addTimer:forMode:", timer, CPDefaultRunLoopMode);
    return timer;
}
}), new objj_method(sel_getUid("timerWithTimeInterval:invocation:repeats:"), function(self, _cmd, seconds, anInvocation, shouldRepeat)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithFireDate:interval:invocation:repeats:", objj_msgSend(CPDate, "dateWithTimeIntervalSinceNow:", seconds), seconds, anInvocation, shouldRepeat);
}
}), new objj_method(sel_getUid("timerWithTimeInterval:target:selector:userInfo:repeats:"), function(self, _cmd, seconds, aTarget, aSelector, userInfo, shouldRepeat)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithFireDate:interval:target:selector:userInfo:repeats:", objj_msgSend(CPDate, "dateWithTimeIntervalSinceNow:", seconds), seconds, aTarget, aSelector, userInfo, shouldRepeat);
}
}), new objj_method(sel_getUid("timerWithTimeInterval:callback:repeats:"), function(self, _cmd, seconds, aFunction, shouldRepeat)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithFireDate:interval:callback:repeats:", objj_msgSend(CPDate, "dateWithTimeIntervalSinceNow:", seconds), seconds, aFunction, shouldRepeat);
}
})]);
}
var CPTimersTimeoutID = 1000,
    CPTimersForTimeoutIDs = {};
var _CPTimerBridgeTimer = function(codeOrFunction, aDelay, shouldRepeat, functionArgs)
{
    var timeoutID = CPTimersTimeoutID++,
        theFunction = nil;
    if (typeof codeOrFunction === "string")
        theFunction = function() { new Function(codeOrFunction)(); if (!shouldRepeat) CPTimersForTimeoutIDs[timeoutID] = nil; }
    else
    {
        if (!functionArgs)
            functionArgs = [];
        theFunction = function() { codeOrFunction.apply(window, functionArgs); if (!shouldRepeat) CPTimersForTimeoutIDs[timeoutID] = nil; }
    }
    CPTimersForTimeoutIDs[timeoutID] = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", aDelay / 1000, theFunction, shouldRepeat);
    return timeoutID;
}
window.setTimeout = function(codeOrFunction, aDelay)
{
    return _CPTimerBridgeTimer(codeOrFunction, aDelay, NO, Array.prototype.slice.apply(arguments, [2]));
}
window.clearTimeout = function(aTimeoutID)
{
    var timer = CPTimersForTimeoutIDs[aTimeoutID];
    if (timer)
        objj_msgSend(timer, "invalidate");
    CPTimersForTimeoutIDs[aTimeoutID] = nil;
}
window.setInterval = function(codeOrFunction, aDelay, functionArgs)
{
    return _CPTimerBridgeTimer(codeOrFunction, aDelay, YES, Array.prototype.slice.apply(arguments, [2]));
}
window.clearInterval = function(aTimeoutID)
{
    window.clearTimeout(aTimeoutID);
}

p;15;CPUndoManager.jt;19772;@STATIC;1.0;i;10;CPObject.ji;14;CPInvocation.ji;9;CPProxy.jt;19705;objj_executeFile("CPObject.j", true);
objj_executeFile("CPInvocation.j", true);
objj_executeFile("CPProxy.j", true);
var CPUndoManagerNormal = 0,
    CPUndoManagerUndoing = 1,
    CPUndoManagerRedoing = 2;
CPUndoManagerCheckpointNotification = "CPUndoManagerCheckpointNotification";
CPUndoManagerDidOpenUndoGroupNotification = "CPUndoManagerDidOpenUndoGroupNotification";
CPUndoManagerDidRedoChangeNotification = "CPUndoManagerDidRedoChangeNotification";
CPUndoManagerDidUndoChangeNotification = "CPUndoManagerDidUndoChangeNotification";
CPUndoManagerWillCloseUndoGroupNotification = "CPUndoManagerWillCloseUndoGroupNotification";
CPUndoManagerWillRedoChangeNotification = "CPUndoManagerWillRedoChangeNotification";
CPUndoManagerWillUndoChangeNotification = "CPUndoManagerWillUndoChangeNotification";
CPUndoCloseGroupingRunLoopOrdering = 350000;
var _CPUndoGroupingPool = [],
    _CPUndoGroupingPoolCapacity = 5;
{var the_class = objj_allocateClassPair(CPObject, "_CPUndoGrouping"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_parent"), new objj_ivar("_invocations")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithParent:"), function(self, _cmd, anUndoGrouping)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPUndoGrouping").super_class }, "init");
    if (self)
    {
        _parent = anUndoGrouping;
        _invocations = [];
    }
    return self;
}
}), new objj_method(sel_getUid("parent"), function(self, _cmd)
{ with(self)
{
    return _parent;
}
}), new objj_method(sel_getUid("addInvocation:"), function(self, _cmd, anInvocation)
{ with(self)
{
    _invocations.push(anInvocation);
}
}), new objj_method(sel_getUid("addInvocationsFromArray:"), function(self, _cmd, invocations)
{ with(self)
{
    objj_msgSend(_invocations, "addObjectsFromArray:", invocations);
}
}), new objj_method(sel_getUid("removeInvocationsWithTarget:"), function(self, _cmd, aTarget)
{ with(self)
{
    var index = _invocations.length;
    while (index--)
        if (objj_msgSend(_invocations[index], "target") == aTarget)
            _invocations.splice(index, 1);
}
}), new objj_method(sel_getUid("invocations"), function(self, _cmd)
{ with(self)
{
    return _invocations;
}
}), new objj_method(sel_getUid("invoke"), function(self, _cmd)
{ with(self)
{
    var index = _invocations.length;
    while (index--)
        objj_msgSend(_invocations[index], "invoke");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_poolUndoGrouping:"), function(self, _cmd, anUndoGrouping)
{ with(self)
{
    if (!anUndoGrouping || _CPUndoGroupingPool.length >= _CPUndoGroupingPoolCapacity)
        return;
    _CPUndoGroupingPool.push(anUndoGrouping);
}
}), new objj_method(sel_getUid("undoGroupingWithParent:"), function(self, _cmd, anUndoGrouping)
{ with(self)
{
    if (_CPUndoGroupingPool.length)
    {
        var grouping = _CPUndoGroupingPool.pop();
        grouping._parent = anUndoGrouping;
        if (grouping._invocations.length)
            grouping._invocations = [];
        return grouping;
    }
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithParent:", anUndoGrouping);
}
})]);
}
var _CPUndoGroupingParentKey = "_CPUndoGroupingParentKey",
    _CPUndoGroupingInvocationsKey = "_CPUndoGroupingInvocationsKey";
{
var the_class = objj_getClass("_CPUndoGrouping")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPUndoGrouping\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPUndoGrouping").super_class }, "init");
    if (self)
    {
        _parent = objj_msgSend(aCoder, "decodeObjectForKey:", _CPUndoGroupingParentKey);
        _invocations = objj_msgSend(aCoder, "decodeObjectForKey:", _CPUndoGroupingInvocationsKey);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _parent, _CPUndoGroupingParentKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _invocations, _CPUndoGroupingInvocationsKey);
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "CPUndoManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_redoStack"), new objj_ivar("_undoStack"), new objj_ivar("_groupsByEvent"), new objj_ivar("_disableCount"), new objj_ivar("_levelsOfUndo"), new objj_ivar("_currentGrouping"), new objj_ivar("_state"), new objj_ivar("_actionName"), new objj_ivar("_preparedTarget"), new objj_ivar("_undoManagerProxy"), new objj_ivar("_runLoopModes"), new objj_ivar("_registeredWithRunLoop")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPUndoManager").super_class }, "init");
    if (self)
    {
        _redoStack = [];
        _undoStack = [];
        _state = CPUndoManagerNormal;
        objj_msgSend(self, "setRunLoopModes:", [CPDefaultRunLoopMode]);
        objj_msgSend(self, "setGroupsByEvent:", YES);
        _undoManagerProxy = objj_msgSend(_CPUndoManagerProxy, "alloc");
        _undoManagerProxy._undoManager = self;
    }
    return self;
}
}), new objj_method(sel_getUid("_addUndoInvocation:"), function(self, _cmd, anInvocation)
{ with(self)
{
    if (!_currentGrouping)
        if (objj_msgSend(self, "groupsByEvent"))
            objj_msgSend(self, "_beginUndoGroupingForEvent");
        else
            objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "No undo group is currently open");
    objj_msgSend(_currentGrouping, "addInvocation:", anInvocation);
    if (_state === CPUndoManagerNormal)
        objj_msgSend(_redoStack, "removeAllObjects");
}
}), new objj_method(sel_getUid("registerUndoWithTarget:selector:object:"), function(self, _cmd, aTarget, aSelector, anObject)
{ with(self)
{
    if (_disableCount > 0)
        return;
    var invocation = objj_msgSend(CPInvocation, "invocationWithMethodSignature:", nil);
    objj_msgSend(invocation, "setTarget:", aTarget);
    objj_msgSend(invocation, "setSelector:", aSelector);
    objj_msgSend(invocation, "setArgument:atIndex:", anObject, 2);
    objj_msgSend(self, "_addUndoInvocation:", invocation);
}
}), new objj_method(sel_getUid("prepareWithInvocationTarget:"), function(self, _cmd, aTarget)
{ with(self)
{
    _preparedTarget = aTarget;
    return _undoManagerProxy;
}
}), new objj_method(sel_getUid("_methodSignatureOfPreparedTargetForSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    if (objj_msgSend(_preparedTarget, "respondsToSelector:", aSelector))
        return 1;
    return nil;
}
}), new objj_method(sel_getUid("_forwardInvocationToPreparedTarget:"), function(self, _cmd, anInvocation)
{ with(self)
{
    if (_disableCount > 0)
        return;
    objj_msgSend(anInvocation, "setTarget:", _preparedTarget);
    objj_msgSend(self, "_addUndoInvocation:", anInvocation);
    _preparedTarget = nil;
}
}), new objj_method(sel_getUid("canRedo"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPUndoManagerCheckpointNotification, self);
    return objj_msgSend(_redoStack, "count") > 0;
}
}), new objj_method(sel_getUid("canUndo"), function(self, _cmd)
{ with(self)
{
    if (_undoStack.length > 0)
        return YES;
    return objj_msgSend(_currentGrouping, "actions").length > 0;
}
}), new objj_method(sel_getUid("undo"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "groupingLevel") === 1)
        objj_msgSend(self, "endUndoGrouping");
    objj_msgSend(self, "undoNestedGroup");
}
}), new objj_method(sel_getUid("undoNestedGroup"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_undoStack, "count") <= 0)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerCheckpointNotification, self);
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerWillUndoChangeNotification, self);
    var undoGrouping = _undoStack.pop();
    _state = CPUndoManagerUndoing;
    objj_msgSend(self, "_beginUndoGrouping");
    objj_msgSend(undoGrouping, "invoke");
    objj_msgSend(self, "endUndoGrouping");
    objj_msgSend(_CPUndoGrouping, "_poolUndoGrouping:", undoGrouping);
    _state = CPUndoManagerNormal;
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerDidUndoChangeNotification, self);
}
}), new objj_method(sel_getUid("redo"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_redoStack, "count") <= 0)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerCheckpointNotification, self);
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerWillRedoChangeNotification, self);
    var oldUndoGrouping = _currentGrouping,
        undoGrouping = _redoStack.pop();
    _currentGrouping = nil;
    _state = CPUndoManagerRedoing;
    objj_msgSend(self, "_beginUndoGrouping");
    objj_msgSend(undoGrouping, "invoke");
    objj_msgSend(self, "endUndoGrouping");
    objj_msgSend(_CPUndoGrouping, "_poolUndoGrouping:", undoGrouping);
    _currentGrouping = oldUndoGrouping;
    _state = CPUndoManagerNormal;
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerDidRedoChangeNotification, self);
}
}), new objj_method(sel_getUid("beginUndoGrouping"), function(self, _cmd)
{ with(self)
{
    if (!_currentGrouping && objj_msgSend(self, "groupsByEvent"))
        objj_msgSend(self, "_beginUndoGroupingForEvent");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPUndoManagerCheckpointNotification, self);
    objj_msgSend(self, "_beginUndoGrouping");
}
}), new objj_method(sel_getUid("_beginUndoGroupingForEvent"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_beginUndoGrouping");
    objj_msgSend(self, "_registerWithRunLoop");
}
}), new objj_method(sel_getUid("_beginUndoGrouping"), function(self, _cmd)
{ with(self)
{
    _currentGrouping = objj_msgSend(_CPUndoGrouping, "undoGroupingWithParent:", _currentGrouping);
}
}), new objj_method(sel_getUid("endUndoGrouping"), function(self, _cmd)
{ with(self)
{
    if (!_currentGrouping)
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "endUndoGrouping. No undo group is currently open.");
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerCheckpointNotification, self);
    var parent = objj_msgSend(_currentGrouping, "parent");
    if (!parent && objj_msgSend(_currentGrouping, "invocations").length > 0)
    {
        objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerWillCloseUndoGroupNotification, self);
        var stack = _state === CPUndoManagerUndoing ? _redoStack : _undoStack;
        stack.push(_currentGrouping);
        if (_levelsOfUndo > 0 && stack.length > _levelsOfUndo)
            stack.splice(0, 1);
    }
    else
    {
        objj_msgSend(parent, "addInvocationsFromArray:", objj_msgSend(_currentGrouping, "invocations"));
        objj_msgSend(_CPUndoGrouping, "_poolUndoGrouping:", _currentGrouping);
    }
    _currentGrouping = parent;
}
}), new objj_method(sel_getUid("enableUndoRegistration"), function(self, _cmd)
{ with(self)
{
    if (_disableCount <= 0)
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "enableUndoRegistration. There are no disable messages in effect right now.");
    _disableCount--;
}
}), new objj_method(sel_getUid("groupsByEvent"), function(self, _cmd)
{ with(self)
{
    return _groupsByEvent;
}
}), new objj_method(sel_getUid("setGroupsByEvent:"), function(self, _cmd, aFlag)
{ with(self)
{
    aFlag = !!aFlag;
    if (_groupsByEvent === aFlag)
        return;
    _groupsByEvent = aFlag;
    if (!objj_msgSend(self, "groupsByEvent"))
        objj_msgSend(self, "_unregisterWithRunLoop");
}
}), new objj_method(sel_getUid("groupingLevel"), function(self, _cmd)
{ with(self)
{
    var grouping = _currentGrouping,
        level = _currentGrouping != nil;
    while (grouping = objj_msgSend(grouping, "parent"))
        ++level;
    return level;
}
}), new objj_method(sel_getUid("disableUndoRegistration"), function(self, _cmd)
{ with(self)
{
    ++_disableCount;
}
}), new objj_method(sel_getUid("isUndoRegistrationEnabled"), function(self, _cmd)
{ with(self)
{
    return _disableCount == 0;
}
}), new objj_method(sel_getUid("isUndoing"), function(self, _cmd)
{ with(self)
{
    return _state === CPUndoManagerUndoing;
}
}), new objj_method(sel_getUid("isRedoing"), function(self, _cmd)
{ with(self)
{
    return _state === CPUndoManagerRedoing;
}
}), new objj_method(sel_getUid("removeAllActions"), function(self, _cmd)
{ with(self)
{
    _redoStack = [];
    _undoStack = [];
    _disableCount = 0;
}
}), new objj_method(sel_getUid("removeAllActionsWithTarget:"), function(self, _cmd, aTarget)
{ with(self)
{
    objj_msgSend(_currentGrouping, "removeInvocationsWithTarget:", aTarget);
    var index = _redoStack.length;
    while (index--)
    {
        var grouping = _redoStack[index];
        objj_msgSend(grouping, "removeInvocationsWithTarget:", aTarget);
        if (!objj_msgSend(grouping, "invocations").length)
            _redoStack.splice(index, 1);
    }
    index = _undoStack.length;
    while (index--)
    {
        var grouping = _undoStack[index];
        objj_msgSend(grouping, "removeInvocationsWithTarget:", aTarget);
        if (!objj_msgSend(grouping, "invocations").length)
            _undoStack.splice(index, 1);
    }
}
}), new objj_method(sel_getUid("setActionName:"), function(self, _cmd, anActionName)
{ with(self)
{
    _actionName = anActionName;
}
}), new objj_method(sel_getUid("redoActionName"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "canRedo") ? _actionName : nil;
}
}), new objj_method(sel_getUid("undoActionName"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "canUndo") ? _actionName : nil;
}
}), new objj_method(sel_getUid("runLoopModes"), function(self, _cmd)
{ with(self)
{
    return _runLoopModes;
}
}), new objj_method(sel_getUid("setRunLoopModes:"), function(self, _cmd, modes)
{ with(self)
{
    _runLoopModes = objj_msgSend(modes, "copy");
    if (_registeredWithRunLoop)
    {
        objj_msgSend(self, "_unregisterWithRunLoop");
        objj_msgSend(self, "_registerWithRunLoop");
    }
}
}), new objj_method(sel_getUid("_runLoopEndUndoGrouping"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "endUndoGrouping");
    _registeredWithRunLoop = NO;
}
}), new objj_method(sel_getUid("_registerWithRunLoop"), function(self, _cmd)
{ with(self)
{
    if (_registeredWithRunLoop)
        return;
    _registeredWithRunLoop = YES;
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelector:target:argument:order:modes:", sel_getUid("_runLoopEndUndoGrouping"), self, nil, CPUndoCloseGroupingRunLoopOrdering, _runLoopModes);
}
}), new objj_method(sel_getUid("_unregisterWithRunLoop"), function(self, _cmd)
{ with(self)
{
    if (!_registeredWithRunLoop)
        return;
    _registeredWithRunLoop = NO;
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "cancelPerformSelector:target:argument:", sel_getUid("_runLoopEndUndoGrouping"), self, nil);
}
}), new objj_method(sel_getUid("observeChangesForKeyPath:ofObject:"), function(self, _cmd, aKeyPath, anObject)
{ with(self)
{
    objj_msgSend(anObject, "addObserver:forKeyPath:options:context:", self, aKeyPath, CPKeyValueObservingOptionOld | CPKeyValueObservingOptionNew, NULL);
}
}), new objj_method(sel_getUid("stopObservingChangesForKeyPath:ofObject:"), function(self, _cmd, aKeyPath, anObject)
{ with(self)
{
    objj_msgSend(anObject, "removeObserver:forKeyPath:", self, aKeyPath);
}
}), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function(self, _cmd, aKeyPath, anObject, aChange, aContext)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "prepareWithInvocationTarget:", anObject), "applyChange:toKeyPath:", objj_msgSend(aChange, "inverseChangeDictionary"), aKeyPath);
}
})]);
}
var CPUndoManagerRedoStackKey = "CPUndoManagerRedoStackKey",
    CPUndoManagerUndoStackKey = "CPUndoManagerUndoStackKey";
    CPUndoManagerLevelsOfUndoKey = "CPUndoManagerLevelsOfUndoKey";
    CPUndoManagerActionNameKey = "CPUndoManagerActionNameKey";
    CPUndoManagerCurrentGroupingKey = "CPUndoManagerCurrentGroupingKey";
    CPUndoManagerRunLoopModesKey = "CPUndoManagerRunLoopModesKey";
    CPUndoManagerGroupsByEventKey = "CPUndoManagerGroupsByEventKey";
{
var the_class = objj_getClass("CPUndoManager")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPUndoManager\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPUndoManager").super_class }, "init");
    if (self)
    {
        _redoStack = objj_msgSend(aCoder, "decodeObjectForKey:", CPUndoManagerRedoStackKey);
        _undoStack = objj_msgSend(aCoder, "decodeObjectForKey:", CPUndoManagerUndoStackKey);
        _levelsOfUndo = objj_msgSend(aCoder, "decodeObjectForKey:", CPUndoManagerLevelsOfUndoKey);
        _actionName = objj_msgSend(aCoder, "decodeObjectForKey:", CPUndoManagerActionNameKey);
        _currentGrouping = objj_msgSend(aCoder, "decodeObjectForKey:", CPUndoManagerCurrentGroupingKey);
        _state = CPUndoManagerNormal;
        objj_msgSend(self, "setRunLoopModes:", objj_msgSend(aCoder, "decodeObjectForKey:", CPUndoManagerRunLoopModesKey));
        objj_msgSend(self, "setGroupsByEvent:", objj_msgSend(aCoder, "decodeBoolForKey:", CPUndoManagerGroupsByEventKey));
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _redoStack, CPUndoManagerRedoStackKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _undoStack, CPUndoManagerUndoStackKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _levelsOfUndo, CPUndoManagerLevelsOfUndoKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _actionName, CPUndoManagerActionNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _currentGrouping, CPUndoManagerCurrentGroupingKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _runLoopModes, CPUndoManagerRunLoopModesKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _groupsByEvent, CPUndoManagerGroupsByEventKey);
}
})]);
}
{var the_class = objj_allocateClassPair(CPProxy, "_CPUndoManagerProxy"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_undoManager")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("methodSignatureForSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    return objj_msgSend(_undoManager, "_methodSignatureOfPreparedTargetForSelector:", aSelector);
}
}), new objj_method(sel_getUid("forwardInvocation:"), function(self, _cmd, anInvocation)
{ with(self)
{
    objj_msgSend(_undoManager, "_forwardInvocationToPreparedTarget:", anInvocation);
}
})]);
}

p;7;CPURL.jt;16419;@STATIC;1.0;I;21;Foundation/CPObject.jt;16373;


objj_executeFile("Foundation/CPObject.j", false);

CPURLNameKey = "CPURLNameKey";
CPURLLocalizedNameKey = "CPURLLocalizedNameKey";
CPURLIsRegularFileKey = "CPURLIsRegularFileKey";
CPURLIsDirectoryKey = "CPURLIsDirectoryKey";
CPURLIsSymbolicLinkKey = "CPURLIsSymbolicLinkKey";
CPURLIsVolumeKey = "CPURLIsVolumeKey";
CPURLIsPackageKey = "CPURLIsPackageKey";
CPURLIsSystemImmutableKey = "CPURLIsSystemImmutableKey";
CPURLIsUserImmutableKey = "CPURLIsUserImmutableKey";
CPURLIsHiddenKey = "CPURLIsHiddenKey";
CPURLHasHiddenExtensionKey = "CPURLHasHiddenExtensionKey";
CPURLCreationDateKey = "CPURLCreationDateKey";
CPURLContentAccessDateKey = "CPURLContentAccessDateKey";
CPURLContentModificationDateKey = "CPURLContentModificationDateKey";
CPURLAttributeModificationDateKey = "CPURLAttributeModificationDateKey";
CPURLLinkCountKey = "CPURLLinkCountKey";
CPURLParentDirectoryURLKey = "CPURLParentDirectoryURLKey";
CPURLVolumeURLKey = "CPURLTypeIdentifierKey";
CPURLTypeIdentifierKey = "CPURLTypeIdentifierKey";
CPURLLocalizedTypeDescriptionKey = "CPURLLocalizedTypeDescriptionKey";
CPURLLabelNumberKey = "CPURLLabelNumberKey";
CPURLLabelColorKey = "CPURLLabelColorKey";
CPURLLocalizedLabelKey = "CPURLLocalizedLabelKey";
CPURLEffectiveIconKey = "CPURLEffectiveIconKey";
CPURLCustomIconKey = "CPURLCustomIconKey";

{var the_class = objj_allocateClassPair(CPObject, "CPURL"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_base"), new objj_ivar("_relative"), new objj_ivar("_resourceValues")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("baseURL"), function(self, _cmd)
{ with(self)
{
return _base;
}
}),
new objj_method(sel_getUid("relativeString"), function(self, _cmd)
{ with(self)
{
return _relative;
}
}), new objj_method(sel_getUid("initWithScheme:host:path:"), function(self, _cmd, scheme, host, path)
{ with(self)
{
    var uri = new URI();
    uri.scheme = scheme;
    uri.authority = host;
    uri.path = path;
    objj_msgSend(self, "initWithString:", uri.toString());
}
}), new objj_method(sel_getUid("initWithString:"), function(self, _cmd, URLString)
{ with(self)
{
    return objj_msgSend(self, "initWithString:relativeToURL:", URLString, nil);
}
}), new objj_method(sel_getUid("initWithString:relativeToURL:"), function(self, _cmd, URLString, baseURL)
{ with(self)
{
    if (!URI_RE.test(URLString))
        return nil;

    if (self)
    {
        _base = baseURL;
        _relative = URLString;
        _resourceValues = objj_msgSend(CPDictionary, "dictionary");
    }

    return self;
}
}), new objj_method(sel_getUid("absoluteURL"), function(self, _cmd)
{ with(self)
{
    var absStr = objj_msgSend(self, "absoluteString");

    if (absStr !== _relative)
        return objj_msgSend(objj_msgSend(CPURL, "alloc"), "initWithString:", absStr);

    return self;
}
}), new objj_method(sel_getUid("absoluteString"), function(self, _cmd)
{ with(self)
{
    return resolve(objj_msgSend(_base, "absoluteString") || "", _relative);
}
}), new objj_method(sel_getUid("relativeString"), function(self, _cmd)
{ with(self)
{
    return _relative;
}
}), new objj_method(sel_getUid("path"), function(self, _cmd)
{ with(self)
{
    var str = objj_msgSend(self, "absoluteString");
    return URI_RE.test(str) ? (parse(str).path || nil) : nil;
}
}), new objj_method(sel_getUid("relativePath"), function(self, _cmd)
{ with(self)
{
    return URI_RE.test(_relative) ? (parse(_relative).path || nil) : nil;
}
}), new objj_method(sel_getUid("scheme"), function(self, _cmd)
{ with(self)
{
    var str = objj_msgSend(self, "absoluteString");
    return URI_RE.test(str) ? (parse(str).protocol || nil) : nil;
}
}), new objj_method(sel_getUid("user"), function(self, _cmd)
{ with(self)
{
    var str = objj_msgSend(self, "absoluteString");
    return URI_RE.test(str) ? (parse(str).user || nil) : nil;
}
}), new objj_method(sel_getUid("password"), function(self, _cmd)
{ with(self)
{
    var str = objj_msgSend(self, "absoluteString");
    return URI_RE.test(str) ? (parse(str).password || nil) : nil;
}
}), new objj_method(sel_getUid("host"), function(self, _cmd)
{ with(self)
{
    var str = objj_msgSend(self, "absoluteString");
    return URI_RE.test(str) ? (parse(str).domain || nil) : nil;
}
}), new objj_method(sel_getUid("port"), function(self, _cmd)
{ with(self)
{
    var str = objj_msgSend(self, "absoluteString");
    if (URI_RE.test(str)) {
        var port = parse(str).port;
        if (port)
            return parseInt(port, 10);
    }
    return nil;
}
}), new objj_method(sel_getUid("parameterString"), function(self, _cmd)
{ with(self)
{
    var str = objj_msgSend(self, "absoluteString");
    return URI_RE.test(str) ? (parse(str).query || nil) : nil;
}
}), new objj_method(sel_getUid("fragment"), function(self, _cmd)
{ with(self)
{
    var str = objj_msgSend(self, "absoluteString");
    return URI_RE.test(str) ? (parse(str).anchor || nil) : nil;
}
}), new objj_method(sel_getUid("isEqual:"), function(self, _cmd, anObject)
{ with(self)
{

    return objj_msgSend(self, "relativeString") === objj_msgSend(anObject, "relativeString") &&
        (objj_msgSend(self, "baseURL") === objj_msgSend(anObject, "baseURL") || objj_msgSend(objj_msgSend(self, "baseURL"), "isEqual:", objj_msgSend(anObject, "baseURL")));
}
}), new objj_method(sel_getUid("lastPathComponent"), function(self, _cmd)
{ with(self)
{
    var path = objj_msgSend(self, "path");
    return path ? path.split("/").pop() : nil;
}
}), new objj_method(sel_getUid("pathExtension"), function(self, _cmd)
{ with(self)
{
    var path = objj_msgSend(self, "path"),
        ext = path.match(/\.(\w+)$/);
    return ext ? ext[1] : "";
}
}), new objj_method(sel_getUid("standardizedURL"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPURL, "URLWithString:relativeToURL:", format(parse(_relative)), _base);
}
}), new objj_method(sel_getUid("isFileURL"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "scheme") === "file";
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "absoluteString");
}
}), new objj_method(sel_getUid("resourceValueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    return objj_msgSend(_resourceValues, "objectForKey:", aKey);
}
}), new objj_method(sel_getUid("setResourceValue:forKey:"), function(self, _cmd, anObject, aKey)
{ with(self)
{
    objj_msgSend(_resourceValues, "setObject:forKey:", anObject, aKey);
}
}), new objj_method(sel_getUid("staticResourceData"), function(self, _cmd)
{ with(self)
{

    return CFBundle.dataContentsAtPath(objj_msgSend(self, "path"));
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("URLWithString:"), function(self, _cmd, URLString)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithString:", URLString);
}
}), new objj_method(sel_getUid("URLWithString:relativeToURL:"), function(self, _cmd, URLString, baseURL)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithString:relativeToURL:", URLString, baseURL);
}
})]);
}

{
var the_class = objj_getClass("CPURL")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPURL\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    _base = objj_msgSend(aCoder, "decodeObjectForKey:", "CPURLBaseKey");
    _relative = objj_msgSend(aCoder, "decodeObjectForKey:", "CPURLRelativeKey");
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _base, "CPURLBaseKey");
    objj_msgSend(aCoder, "encodeObject:forKey:", _relative, "CPURLRelativeKey");
}
})]);
}




var URI_RE = /^(?:([^:\/?\#]+):)?(?:\/\/([^\/?\#]*))?([^?\#]*)(?:\?([^\#]*))?(?:\#(.*))?/;




var URI = function(str) {
    if (!str) str = "";
    var result = str.match(URI_RE);
    this.scheme = result[1] || null;
    this.authority = result[2] || null;
    this.path = result[3] || null;
    this.query = result[4] || null;
    this.fragment = result[5] || null;
}




URI.prototype.toString = function () {
    var str = "";

    if (this.scheme)
        str += this.scheme + ":";

    if (this.authority)
        str += "//" + this.authority;

    if (this.path)
        str += this.path;

    if (this.query)
        str += "?" + this.query;

    if (this.fragment)
        str += "#" + this.fragment;

    return str;
}

var parse = function(uri) {
    return new URI(uri);
}

var unescape = function(str, plus) {
    return decodeURI(str).replace(/\+/g, " ");
}

var unescapeComponent = function(str, plus) {
    return decodeURIComponent(str).replace(/\+/g, " ");
}






var keys = [
    "url",
    "protocol",
    "authorityRoot",
    "authority",
        "userInfo",
            "user",
            "password",
        "domain",
            "domains",
        "port",
    "path",
        "root",
        "directory",
            "directories",
        "file",
    "query",
    "anchor"
];





var expressionKeys = [
    "url",
    "protocol",
    "authorityRoot",
    "authority",
        "userInfo",
            "user",
            "password",
        "domain",
        "port",
    "path",
        "root",
        "directory",
        "file",
    "query",
    "anchor"
];



var strictExpression = new RegExp(
    "^" +
    "(?:" +
        "([^:/?#]+):" +
    ")?" +
    "(?:" +
        "(//)" +
        "(" +
            "(?:" +
                "(" +
                    "([^:@]*)" +
                    ":?" +
                    "([^:@]*)" +
                ")?" +
                "@" +
            ")?" +
            "([^:/?#]*)" +
            "(?::(\\d*))?" +
        ")" +
    ")?" +
    "(" +
        "(/?)" +
        "((?:[^?#/]*/)*)" +
        "([^?#]*)" +
    ")" +
    "(?:\\?([^#]*))?" +
    "(?:#(.*))?"
);







var Parser = function (expression) {
    return function (url) {
        if (typeof url == "undefined")
            throw new Error("HttpError: URL is undefined");
        if (typeof url != "string") return new Object(url);

        var items = {};
        var parts = expression.exec(url);

        for (var i = 0; i < parts.length; i++) {
            items[expressionKeys[i]] = parts[i] ? parts[i] : "";
        }

        items.root = (items.root || items.authorityRoot) ? '/' : '';

        items.directories = items.directory.split("/");
        if (items.directories[items.directories.length - 1] == "") {
            items.directories.pop();
        }


        var directories = [];
        for (var i = 0; i < items.directories.length; i++) {
            var directory = items.directories[i];
            if (directory == '.') {
            } else if (directory == '..') {
                if (directories.length && directories[directories.length - 1] != '..')
                    directories.pop();
                else
                    directories.push('..');
            } else {
                directories.push(directory);
            }
        }
        items.directories = directories;

        items.domains = items.domain.split(".");

        return items;
    };
};




var parse = Parser(strictExpression);





var format = function (object) {
    if (typeof(object) == 'undefined')
        throw new Error("UrlError: URL undefined for urls#format");
    if (object instanceof String || typeof(object) == 'string')
        return object;
    var domain =
        object.domains ?
        object.domains.join(".") :
        object.domain;
    var userInfo = (
            object.user ||
            object.password
        ) ?
        (
            (object.user || "") +
            (object.password ? ":" + object.password : "")
        ) :
        object.userInfo;
    var authority = (
            userInfo ||
            domain ||
            object.port
        ) ? (
            (userInfo ? userInfo + "@" : "") +
            (domain || "") +
            (object.port ? ":" + object.port : "")
        ) :
        object.authority;
    var directory =
        object.directories ?
        object.directories.join("/") :
        object.directory;
    var path =
        directory || object.file ?
        (
            (directory ? directory + "/" : "") +
            (object.file || "")
        ) :
        object.path;
    return (
        (object.protocol ? object.protocol + ":" : "") +
        (authority ? "//" + authority : "") +
        (object.root || (authority && path) ? "/" : "") +
        (path ? path : "") +
        (object.query ? "?" + object.query : "") +
        (object.anchor ? "#" + object.anchor : "")
    ) || object.url || "";
};





var resolveObject = function (source, relative) {
    if (!source)
        return relative;

    source = parse(source);
    relative = parse(relative);

    if (relative.url == "")
        return source;

    delete source.url;
    delete source.authority;
    delete source.domain;
    delete source.userInfo;
    delete source.path;
    delete source.directory;

    if (
        relative.protocol && relative.protocol != source.protocol ||
        relative.authority && relative.authority != source.authority
    ) {
        source = relative;
    } else {
        if (relative.root) {
            source.directories = relative.directories;
        } else {

            var directories = relative.directories;
            for (var i = 0; i < directories.length; i++) {
                var directory = directories[i];
                if (directory == ".") {
                } else if (directory == "..") {
                    if (source.directories.length) {
                        source.directories.pop();
                    } else {
                        source.directories.push('..');
                    }
                } else {
                    source.directories.push(directory);
                }
            }

            if (relative.file == ".") {
                relative.file = "";
            } else if (relative.file == "..") {
                source.directories.pop();
                relative.file = "";
            }
        }
    }

    if (relative.root)
        source.root = relative.root;
    if (relative.protcol)
        source.protocol = relative.protocol;
    if (!(!relative.path && relative.anchor))
        source.file = relative.file;
    source.query = relative.query;
    source.anchor = relative.anchor;

    return source;
};





var relativeObject = function (source, target) {
    target = parse(target);
    source = parse(source);

    delete target.url;

    if (
        target.protocol == source.protocol &&
        target.authority == source.authority
    ) {
        delete target.protocol;
        delete target.authority;
        delete target.userInfo;
        delete target.user;
        delete target.password;
        delete target.domain;
        delete target.domains;
        delete target.port;
        if (
            !!target.root == !!source.root && !(
                target.root &&
                target.directories[0] != source.directories[0]
            )
        ) {
            delete target.path;
            delete target.root;
            delete target.directory;
            while (
                source.directories.length &&
                target.directories.length &&
                target.directories[0] == source.directories[0]
            ) {
                target.directories.shift();
                source.directories.shift();
            }
            while (source.directories.length) {
                source.directories.shift();
                target.directories.unshift('..');
            }

            if (!target.root && !target.directories.length && !target.file && source.file)
                target.directories.push('.');

            if (source.file == target.file)
                delete target.file;
            if (source.query == target.query)
                delete target.query;
            if (source.anchor == target.anchor)
                delete target.anchor;
        }
    }

    return target;
};




var resolve = function (source, relative) {
    return format(resolveObject(source, relative));
};




var relative = function (source, target) {
    return format(relativeObject(source, target));
};

p;17;CPURLConnection.jt;7079;@STATIC;1.0;i;10;CPObject.ji;11;CPRunLoop.ji;14;CPURLRequest.ji;15;CPURLResponse.jt;6990;objj_executeFile("CPObject.j", true);
objj_executeFile("CPRunLoop.j", true);
objj_executeFile("CPURLRequest.j", true);
objj_executeFile("CPURLResponse.j", true);
var CPURLConnectionDelegate = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPURLConnection"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_request"), new objj_ivar("_delegate"), new objj_ivar("_isCanceled"), new objj_ivar("_isLocalFileConnection"), new objj_ivar("_HTTPRequest")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithRequest:delegate:startImmediately:"), function(self, _cmd, aRequest, aDelegate, shouldStartImmediately)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPURLConnection").super_class }, "init");
    if (self)
    {
        _request = aRequest;
        _delegate = aDelegate;
        _isCanceled = NO;
        var URL = objj_msgSend(_request, "URL"),
            scheme = objj_msgSend(URL, "scheme");
        _isLocalFileConnection = scheme === "file" ||
                                    ((scheme === "http" || scheme === "https:") &&
                                    window.location &&
                                    (window.location.protocol === "file:" || window.location.protocol === "app:"));
        _HTTPRequest = new HTTPRequest();
        if (shouldStartImmediately)
            objj_msgSend(self, "start");
    }
    return self;
}
}), new objj_method(sel_getUid("initWithRequest:delegate:"), function(self, _cmd, aRequest, aDelegate)
{ with(self)
{
    return objj_msgSend(self, "initWithRequest:delegate:startImmediately:", aRequest, aDelegate, YES);
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("start"), function(self, _cmd)
{ with(self)
{
    _isCanceled = NO;
    try
    {
        _HTTPRequest.open(objj_msgSend(_request, "HTTPMethod"), objj_msgSend(objj_msgSend(_request, "URL"), "absoluteString"), YES);
        _HTTPRequest.onreadystatechange = function() { objj_msgSend(self, "_readyStateDidChange"); }
        var fields = objj_msgSend(_request, "allHTTPHeaderFields"),
            key = nil,
            keys = objj_msgSend(fields, "keyEnumerator");
        while (key = objj_msgSend(keys, "nextObject"))
            _HTTPRequest.setRequestHeader(key, objj_msgSend(fields, "objectForKey:", key));
        _HTTPRequest.send(objj_msgSend(_request, "HTTPBody"));
    }
    catch (anException)
    {
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("connection:didFailWithError:")))
            objj_msgSend(_delegate, "connection:didFailWithError:", self, anException);
    }
}
}), new objj_method(sel_getUid("cancel"), function(self, _cmd)
{ with(self)
{
    _isCanceled = YES;
    try
    {
        _HTTPRequest.abort();
    }
    catch (anException)
    {
    }
}
}), new objj_method(sel_getUid("isLocalFileConnection"), function(self, _cmd)
{ with(self)
{
    return _isLocalFileConnection;
}
}), new objj_method(sel_getUid("_readyStateDidChange"), function(self, _cmd)
{ with(self)
{
    if (_HTTPRequest.readyState() === HTTPRequest.CompleteState)
    {
        var statusCode = _HTTPRequest.status(),
            URL = objj_msgSend(_request, "URL");
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("connection:didReceiveResponse:")))
        {
            if (_isLocalFileConnection)
                objj_msgSend(_delegate, "connection:didReceiveResponse:", self, objj_msgSend(objj_msgSend(CPURLResponse, "alloc"), "initWithURL:", URL));
            else
            {
                var response = objj_msgSend(objj_msgSend(CPHTTPURLResponse, "alloc"), "initWithURL:", URL);
                objj_msgSend(response, "_setStatusCode:", statusCode);
                objj_msgSend(_delegate, "connection:didReceiveResponse:", self, response);
            }
        }
        if (!_isCanceled)
        {
            if (statusCode === 401 && objj_msgSend(CPURLConnectionDelegate, "respondsToSelector:", sel_getUid("connectionDidReceiveAuthenticationChallenge:")))
                objj_msgSend(CPURLConnectionDelegate, "connectionDidReceiveAuthenticationChallenge:", self);
            else
            {
                if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("connection:didReceiveData:")))
                    objj_msgSend(_delegate, "connection:didReceiveData:", self, _HTTPRequest.responseText());
                if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("connectionDidFinishLoading:")))
                    objj_msgSend(_delegate, "connectionDidFinishLoading:", self);
            }
        }
    }
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
}), new objj_method(sel_getUid("_HTTPRequest"), function(self, _cmd)
{ with(self)
{
    return _HTTPRequest;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("setClassDelegate:"), function(self, _cmd, delegate)
{ with(self)
{
    CPURLConnectionDelegate = delegate;
}
}), new objj_method(sel_getUid("sendSynchronousRequest:returningResponse:"), function(self, _cmd, aRequest, aURLResponse)
{ with(self)
{
    try
    {
        var request = new HTTPRequest();
        request.open(objj_msgSend(aRequest, "HTTPMethod"), objj_msgSend(objj_msgSend(aRequest, "URL"), "absoluteString"), NO);
        var fields = objj_msgSend(aRequest, "allHTTPHeaderFields"),
            key = nil,
            keys = objj_msgSend(fields, "keyEnumerator");
        while (key = objj_msgSend(keys, "nextObject"))
            request.setRequestHeader(key, objj_msgSend(fields, "objectForKey:", key));
        request.send(objj_msgSend(aRequest, "HTTPBody"));
        return objj_msgSend(CPData, "dataWithEncodedString:", request.responseText());
    }
    catch (anException)
    {
    }
    return nil;
}
}), new objj_method(sel_getUid("connectionWithRequest:delegate:"), function(self, _cmd, aRequest, aDelegate)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithRequest:delegate:", aRequest, aDelegate);
}
})]);
}
{
var the_class = objj_getClass("CPURLConnection")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPURLConnection\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_XMLHTTPRequest"), function(self, _cmd)
{ with(self)
{
    _CPReportLenientDeprecation(self, _cmd, sel_getUid("_HTTPRequest"));
    return objj_msgSend(self, "_HTTPRequest");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sendSynchronousRequest:returningResponse:error:"), function(self, _cmd, aRequest, aURLResponse, anError)
{ with(self)
{
    _CPReportLenientDeprecation(self, _cmd, sel_getUid("sendSynchronousRequest:returningResponse:"));
    return objj_msgSend(self, "sendSynchronousRequest:returningResponse:", aRequest, aURLResponse);
}
})]);
}

p;14;CPURLRequest.jt;2624;@STATIC;1.0;i;10;CPObject.jt;2590;objj_executeFile("CPObject.j", true);
{var the_class = objj_allocateClassPair(CPObject, "CPURLRequest"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_URL"), new objj_ivar("_HTTPBody"), new objj_ivar("_HTTPMethod"), new objj_ivar("_HTTPHeaderFields")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithURL:"), function(self, _cmd, aURL)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPURLRequest").super_class }, "init");
    if (self)
    {
        objj_msgSend(self, "setURL:", aURL);
        _HTTPBody = "";
        _HTTPMethod = "GET";
        _HTTPHeaderFields = objj_msgSend(CPDictionary, "dictionary");
        objj_msgSend(self, "setValue:forHTTPHeaderField:", "Thu, 1 Jan 1970 00:00:00 GMT", "If-Modified-Since");
        objj_msgSend(self, "setValue:forHTTPHeaderField:", "no-cache", "Cache-Control");
        objj_msgSend(self, "setValue:forHTTPHeaderField:", "XMLHttpRequest", "X-Requested-With");
    }
    return self;
}
}), new objj_method(sel_getUid("URL"), function(self, _cmd)
{ with(self)
{
    return _URL;
}
}), new objj_method(sel_getUid("setURL:"), function(self, _cmd, aURL)
{ with(self)
{
    if (objj_msgSend(aURL, "isKindOfClass:", objj_msgSend(CPURL, "class")))
        _URL = aURL;
    else
        _URL = objj_msgSend(CPURL, "URLWithString:", String(aURL));
}
}), new objj_method(sel_getUid("setHTTPBody:"), function(self, _cmd, anHTTPBody)
{ with(self)
{
    _HTTPBody = anHTTPBody;
}
}), new objj_method(sel_getUid("HTTPBody"), function(self, _cmd)
{ with(self)
{
    return _HTTPBody;
}
}), new objj_method(sel_getUid("setHTTPMethod:"), function(self, _cmd, anHTTPMethod)
{ with(self)
{
    _HTTPMethod = anHTTPMethod;
}
}), new objj_method(sel_getUid("HTTPMethod"), function(self, _cmd)
{ with(self)
{
    return _HTTPMethod;
}
}), new objj_method(sel_getUid("allHTTPHeaderFields"), function(self, _cmd)
{ with(self)
{
    return _HTTPHeaderFields;
}
}), new objj_method(sel_getUid("valueForHTTPHeaderField:"), function(self, _cmd, aField)
{ with(self)
{
    return objj_msgSend(_HTTPHeaderFields, "objectForKey:", aField);
}
}), new objj_method(sel_getUid("setValue:forHTTPHeaderField:"), function(self, _cmd, aValue, aField)
{ with(self)
{
    objj_msgSend(_HTTPHeaderFields, "setObject:forKey:", aValue, aField);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("requestWithURL:"), function(self, _cmd, aURL)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPURLRequest, "alloc"), "initWithURL:", aURL);
}
})]);
}

p;15;CPURLResponse.jt;1111;@STATIC;1.0;i;10;CPObject.jt;1077;objj_executeFile("CPObject.j", true);
{var the_class = objj_allocateClassPair(CPObject, "CPURLResponse"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_URL")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithURL:"), function(self, _cmd, aURL)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPURLResponse").super_class }, "init");
    if (self)
        _URL = aURL;
    return self;
}
}), new objj_method(sel_getUid("URL"), function(self, _cmd)
{ with(self)
{
    return _URL;
}
})]);
}
{var the_class = objj_allocateClassPair(CPURLResponse, "CPHTTPURLResponse"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_statusCode")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_setStatusCode:"), function(self, _cmd, aStatusCode)
{ with(self)
{
    _statusCode = aStatusCode;
}
}), new objj_method(sel_getUid("statusCode"), function(self, _cmd)
{ with(self)
{
    return _statusCode;
}
})]);
}

p;22;CPUserSessionManager.jt;2377;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jt;2306;objj_executeFile("Foundation/CPObject.j", false);
objj_executeFile("Foundation/CPString.j", false);
CPUserSessionUndeterminedStatus = 0;
CPUserSessionLoggedInStatus = 1;
CPUserSessionLoggedOutStatus = 2;
CPUserSessionManagerStatusDidChangeNotification = "CPUserSessionManagerStatusDidChangeNotification";
CPUserSessionManagerUserIdentifierDidChangeNotification = "CPUserSessionManagerUserIdentifierDidChangeNotification";
var CPDefaultUserSessionManager = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPUserSessionManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_status"), new objj_ivar("_userIdentifier")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPUserSessionManager").super_class }, "init");
    if (self)
        _status = CPUserSessionUndeterminedStatus;
    return self;
}
}), new objj_method(sel_getUid("status"), function(self, _cmd)
{ with(self)
{
    return _status;
}
}), new objj_method(sel_getUid("setStatus:"), function(self, _cmd, aStatus)
{ with(self)
{
    if (_status == aStatus)
        return;
    _status = aStatus;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPUserSessionManagerStatusDidChangeNotification, self);
    if (_status != CPUserSessionLoggedInStatus)
        objj_msgSend(self, "setUserIdentifier:", nil);
}
}), new objj_method(sel_getUid("userIdentifier"), function(self, _cmd)
{ with(self)
{
    return _userIdentifier;
}
}), new objj_method(sel_getUid("setUserIdentifier:"), function(self, _cmd, anIdentifier)
{ with(self)
{
    if (_userIdentifier == anIdentifier)
        return;
    _userIdentifier = anIdentifier;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPUserSessionManagerUserIdentifierDidChangeNotification, self);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultManager"), function(self, _cmd)
{ with(self)
{
    if (!CPDefaultUserSessionManager)
        CPDefaultUserSessionManager = objj_msgSend(objj_msgSend(CPUserSessionManager, "alloc"), "init");
    return CPDefaultUserSessionManager;
}
})]);
}

p;9;CPValue.jt;2062;@STATIC;1.0;i;10;CPObject.ji;9;CPCoder.jt;2015;objj_executeFile("CPObject.j", true);
objj_executeFile("CPCoder.j", true);
{var the_class = objj_allocateClassPair(CPObject, "CPValue"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_JSObject")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithJSObject:"), function(self, _cmd, aJSObject)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPValue").super_class }, "init");
    if (self)
        _JSObject = aJSObject;
    return self;
}
}), new objj_method(sel_getUid("JSObject"), function(self, _cmd)
{ with(self)
{
    return _JSObject;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("valueWithJSObject:"), function(self, _cmd, aJSObject)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithJSObject:", aJSObject);
}
})]);
}
var CPValueValueKey = "CPValueValueKey";
{
var the_class = objj_getClass("CPValue")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPValue\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPValue").super_class }, "init");
    if (self)
        _JSObject = JSON.parse(objj_msgSend(aCoder, "decodeObjectForKey:", CPValueValueKey));
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", JSON.stringify(_JSObject), CPValueValueKey);
}
})]);
}
CPJSObjectCreateJSON= function(aJSObject)
{
    CPLog.warn("CPJSObjectCreateJSON deprecated, use JSON.stringify() or CPString's objectFromJSON");
    return JSON.stringify(aJSObject);
}
CPJSObjectCreateWithJSON= function(aString)
{
    CPLog.warn("CPJSObjectCreateWithJSON deprecated, use JSON.parse() or CPString's JSONFromObject");
    return JSON.parse(aString);
}

p;17;CPWebDAVManager.jt;6628;@STATIC;1.0;t;6609;


var setURLResourceValuesForKeysFromProperties = function(aURL, keys, properties)
{
    var resourceType = objj_msgSend(properties, "objectForKey:", "resourcetype");

    if (resourceType === CPWebDAVManagerCollectionResourceType)
    {
        objj_msgSend(aURL, "setResourceValue:forKey:", YES, CPURLIsDirectoryKey);
        objj_msgSend(aURL, "setResourceValue:forKey:", NO, CPURLIsRegularFileKey);
    }
    else if (resourceType === CPWebDAVManagerNonCollectionResourceType)
    {
        objj_msgSend(aURL, "setResourceValue:forKey:", NO, CPURLIsDirectoryKey);
        objj_msgSend(aURL, "setResourceValue:forKey:", YES, CPURLIsRegularFileKey);
    }

    var displayName = objj_msgSend(properties, "objectForKey:", "displayname");

    if (displayName !== nil)
    {
        objj_msgSend(aURL, "setResourceValue:forKey:", displayName, CPURLNameKey);
        objj_msgSend(aURL, "setResourceValue:forKey:", displayName, CPURLLocalizedNameKey);
    }
}

CPWebDAVManagerCollectionResourceType = 1;
CPWebDAVManagerNonCollectionResourceType = 0;

{var the_class = objj_allocateClassPair(CPObject, "CPWebDAVManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_blocksForConnections")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWebDAVManager").super_class }, "init");

    if (self)
        _blocksForConnections = objj_msgSend(CPDictionary, "dictionary");

    return self;
}
}), new objj_method(sel_getUid("contentsOfDirectoryAtURL:includingPropertiesForKeys:options:block:"), function(self, _cmd, aURL, keys, aMask, aBlock)
{ with(self)
{
    var properties = [],
        count = objj_msgSend(keys, "count");

    while (count--)
        properties.push(WebDAVPropertiesForURLKeys[keys[count]]);

    var makeContents = function(aURL, response)
    {
        var contents = [],
            URLString = nil,
            URLStrings = objj_msgSend(response, "keyEnumerator");

        while (URLString = objj_msgSend(URLStrings, "nextObject"))
        {
            var URL = objj_msgSend(CPURL, "URLWithString:", URLString),
                properties = objj_msgSend(response, "objectForKey:", URLString);


            if (!objj_msgSend(objj_msgSend(URL, "absoluteString"), "isEqual:", objj_msgSend(aURL, "absoluteString")))
            {
                contents.push(URL);

                setURLResourceValuesForKeysFromProperties(URL, keys, properties);
            }
        }

        return contents;
    }

    if (!aBlock)
        return makeContents(aURL, response);

    objj_msgSend(self, "PROPFIND:properties:depth:block:", aURL, properties, 1, function(aURL, response)
    {
        aBlock(aURL, makeContents(aURL, response));
    });
}
}), new objj_method(sel_getUid("PROPFIND:properties:depth:block:"), function(self, _cmd, aURL, properties, aDepth, aBlock)
{ with(self)
{
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);

    objj_msgSend(request, "setHTTPMethod:", "PROPFIND");
    objj_msgSend(request, "setValue:forHTTPHeaderField:", aDepth, "Depth");

    var HTTPBody = ["<?xml version=\"1.0\"?><a:propfind xmlns:a=\"DAV:\">"],
        index = 0,
        count = properties.length;

    for (; index < count; ++index)
        HTTPBody.push("<a:prop><a:", properties[index], "/></a:prop>");

    HTTPBody.push("</a:propfind>");

    objj_msgSend(request, "setHTTPBody:", HTTPBody.join(""));

    if (!aBlock)
        return parsePROPFINDResponse(objj_msgSend(objj_msgSend(CPURLConnection, "sendSynchronousRequest:returningResponse:error:", request, nil, nil), "encodedString"));

    else
    {
        var connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);

        objj_msgSend(_blocksForConnections, "setObject:forKey:", aBlock, objj_msgSend(connection, "UID"));
    }
}
}), new objj_method(sel_getUid("connection:didReceiveData:"), function(self, _cmd, aURLConnection, aString)
{ with(self)
{
    var block = objj_msgSend(_blocksForConnections, "objectForKey:", objj_msgSend(aURLConnection, "UID"));


    block(objj_msgSend(aURLConnection._request, "URL"), parsePROPFINDResponse(aString));
}
})]);
}

var WebDAVPropertiesForURLKeys = { };

WebDAVPropertiesForURLKeys[CPURLNameKey] = "displayname";
WebDAVPropertiesForURLKeys[CPURLLocalizedNameKey] = "displayname";
WebDAVPropertiesForURLKeys[CPURLIsRegularFileKey] = "resourcetype";
WebDAVPropertiesForURLKeys[CPURLIsDirectoryKey] = "resourcetype";
var XMLDocumentFromString = function(anXMLString)
{
    if (typeof window["ActiveXObject"] !== "undefined")
    {
        var XMLDocument = new ActiveXObject("Microsoft.XMLDOM");
        XMLDocument.async = false;
        XMLDocument.loadXML(anXMLString);
        return XMLDocument;
    }
    return new DOMParser().parseFromString(anXMLString,"text/xml");
}
var parsePROPFINDResponse = function(anXMLString)
{
    var XMLDocument = XMLDocumentFromString(anXMLString),
        responses = XMLDocument.getElementsByTagNameNS("*", "response"),
        responseIndex = 0,
        responseCount = responses.length;
    var propertiesForURLs = objj_msgSend(CPDictionary, "dictionary");
    for (; responseIndex < responseCount; ++responseIndex)
    {
        var response = responses[responseIndex],
            elements = response.getElementsByTagNameNS("*", "prop").item(0).childNodes,
            index = 0,
            count = elements.length,
            properties = objj_msgSend(CPDictionary, "dictionary");
        for (; index < count; ++index)
        {
            var element = elements[index];
            if (element.nodeType === 8 || element.nodeType === 3)
                continue;
            var nodeName = element.nodeName,
                colonIndex = nodeName.lastIndexOf(':');
            if (colonIndex > -1)
                nodeName = nodeName.substr(colonIndex + 1);
            if (nodeName === "resourcetype")
                objj_msgSend(properties, "setObject:forKey:", element.firstChild ? CPWebDAVManagerCollectionResourceType : CPWebDAVManagerNonCollectionResourceType, nodeName);
            else
                objj_msgSend(properties, "setObject:forKey:", element.firstChild.nodeValue, nodeName);
        }
        var href = response.getElementsByTagNameNS("*", "href").item(0);
        objj_msgSend(propertiesForURLs, "setObject:forKey:", properties, href.firstChild.nodeValue);
    }
    return propertiesForURLs;
}
var mapURLsAndProperties = function( properties, ignoredURL)
{
}

p;12;Foundation.jt;2295;@STATIC;1.0;i;9;CPArray.ji;10;CPBundle.ji;9;CPCoder.ji;8;CPData.ji;8;CPDate.ji;14;CPDictionary.ji;14;CPEnumerator.ji;13;CPException.ji;12;CPIndexSet.ji;14;CPInvocation.ji;19;CPJSONPConnection.ji;17;CPKeyedArchiver.ji;19;CPKeyedUnarchiver.ji;18;CPKeyValueCoding.ji;21;CPKeyValueObserving.ji;7;CPLog.ji;16;CPNotification.ji;22;CPNotificationCenter.ji;8;CPNull.ji;10;CPNumber.ji;10;CPObject.ji;15;CPObjJRuntime.ji;13;CPOperation.ji;18;CPOperationQueue.ji;29;CPPropertyListSerialization.ji;9;CPRange.ji;11;CPRunLoop.ji;7;CPSet.ji;18;CPSortDescriptor.ji;10;CPString.ji;9;CPTimer.ji;15;CPUndoManager.ji;7;CPURL.ji;17;CPURLConnection.ji;14;CPURLRequest.ji;15;CPURLResponse.ji;22;CPUserSessionManager.ji;9;CPValue.jt;1581;objj_executeFile("CPArray.j", true);
objj_executeFile("CPBundle.j", true);
objj_executeFile("CPCoder.j", true);
objj_executeFile("CPData.j", true);
objj_executeFile("CPDate.j", true);
objj_executeFile("CPDictionary.j", true);
objj_executeFile("CPEnumerator.j", true);
objj_executeFile("CPException.j", true);
objj_executeFile("CPIndexSet.j", true);
objj_executeFile("CPInvocation.j", true);
objj_executeFile("CPJSONPConnection.j", true);
objj_executeFile("CPKeyedArchiver.j", true);
objj_executeFile("CPKeyedUnarchiver.j", true);
objj_executeFile("CPKeyValueCoding.j", true);
objj_executeFile("CPKeyValueObserving.j", true);
objj_executeFile("CPLog.j", true);
objj_executeFile("CPNotification.j", true);
objj_executeFile("CPNotificationCenter.j", true);
objj_executeFile("CPNull.j", true);
objj_executeFile("CPNumber.j", true);
objj_executeFile("CPObject.j", true);
objj_executeFile("CPObjJRuntime.j", true);
objj_executeFile("CPOperation.j", true);
objj_executeFile("CPOperationQueue.j", true);
objj_executeFile("CPPropertyListSerialization.j", true);
objj_executeFile("CPRange.j", true);
objj_executeFile("CPRunLoop.j", true);
objj_executeFile("CPSet.j", true);
objj_executeFile("CPSortDescriptor.j", true);
objj_executeFile("CPString.j", true);
objj_executeFile("CPTimer.j", true);
objj_executeFile("CPUndoManager.j", true);
objj_executeFile("CPURL.j", true);
objj_executeFile("CPURLConnection.j", true);
objj_executeFile("CPURLRequest.j", true);
objj_executeFile("CPURLResponse.j", true);
objj_executeFile("CPUserSessionManager.j", true);
objj_executeFile("CPValue.j", true);

e;