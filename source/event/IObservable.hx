package event;

interface IObservable
{
    function attach(o:IObserver, mask:Int = 0):Void;

    function detach(o:IObserver, mask:Int = 0):Void;

    function notify(type:Int, userData:Dynamic = null):Void;
}