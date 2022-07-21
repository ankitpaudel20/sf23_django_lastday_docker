from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
def dashboard(request):
    return render(request, "ExpenseTracker/dashboard.html")

def add_expense(request):
    return render(request, "ExpenseTracker/add_expense.html")