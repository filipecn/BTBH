package event;

interface IObserver
{
    function recieveNotification(type:Int, source:IObservable, userData:Dynamic):Void;
}